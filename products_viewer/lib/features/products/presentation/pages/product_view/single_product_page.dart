import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/core/constants/colors.dart';
import 'package:products_viewer/core/constants/widgets/leading_button.dart';
import 'package:products_viewer/features/products/presentation/bloc/single_product/single_product_bloc.dart';
import 'package:products_viewer/features/products/presentation/bloc/single_product/single_product_event.dart';
import 'package:products_viewer/features/products/presentation/bloc/single_product/single_product_state.dart';
import 'package:products_viewer/features/products/presentation/widgets/product_description_card.dart';
import 'package:products_viewer/features/products/presentation/widgets/product_title_card.dart';
import 'package:products_viewer/injection_container.dart';

class SingleProductPage extends StatefulWidget {
  final int id;
  const SingleProductPage({super.key, required this.id});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  final SingleProductBloc _singleProductBloc = SingleProductBloc(instance());

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  void _loadProduct() {
    _singleProductBloc.add(GetSingleProduct(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SingleProductBloc>(
      create: (context) => _singleProductBloc,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<SingleProductBloc, SingleProductState>(
      builder: (_, state) {
        if (state is SingleProductLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is SingleProductErrorState) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is SingleProductLoadedState) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LeadingButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.black,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Image.network(
                              state.product?.images?.first ?? '',
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            width: 80,
                            height: 30,
                            color: ThemeColors.secondary,
                            child: Center(
                              child: Text(
                                '${state.product?.discountPercentage}% OFF',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductTitleCard(product: state.product),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductDescriptionCard(
                    product: state.product,
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
