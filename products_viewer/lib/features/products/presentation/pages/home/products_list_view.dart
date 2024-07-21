import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products_viewer/core/constants/colors.dart';
import 'package:products_viewer/core/constants/routes.dart';
import 'package:products_viewer/features/products/presentation/bloc/product_list/product_list_bloc.dart';
import 'package:products_viewer/features/products/presentation/bloc/product_list/product_list_event.dart';
import 'package:products_viewer/features/products/presentation/bloc/product_list/product_list_state.dart';
import 'package:products_viewer/features/products/presentation/widgets/product_list_card.dart';
import 'package:products_viewer/injection_container.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView({super.key});

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  final ProductListBloc _productsListBloc = ProductListBloc(instance());
  late int currentPage;
  int itemsPerPage = 10;
  int skip = 1;
  @override
  void initState() {
    super.initState();

    _loadProducts();

    currentPage = 1;
  }

  void _loadProducts() {
    _productsListBloc.add(GetProductList(itemsPerPage, skip > 0 ? skip : 1));
  }

  void nextPage() {
    setState(() {
      currentPage++;
      skip = (currentPage - 1) * itemsPerPage;
      _loadProducts();
    });
  }

  void previousPage() {
    setState(() {
      currentPage--;
      skip = (currentPage - 1) * itemsPerPage;
      _loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListBloc>(
      create: (context) => _productsListBloc,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (_, state) {
        if (state is ProductListLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is ProductListErrorState) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is ProductListLoadedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.productViewPage.name,
                                extra: state.productList?[index].id);
                          },
                          child: ProductListCard(
                              product: state.productList![index]),
                        );
                      },
                      itemCount: state.productList!.length),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          currentPage > 1 ? previousPage() : null;
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: ThemeColors.secondary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '$currentPage',
                        style: const TextStyle(
                            color: ThemeColors.secondary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          nextPage();
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ThemeColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
