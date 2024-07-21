import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/core/resources/data_state.dart';
import 'package:products_viewer/features/products/domain/usecases/get_productList.dart';
import 'package:products_viewer/features/products/presentation/bloc/product_list/product_list_event.dart';
import 'package:products_viewer/features/products/presentation/bloc/product_list/product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductListUseCase _getProductListUseCase;

  ProductListBloc(this._getProductListUseCase)
      : super(const ProductListLoadingState()) {
    on<GetProductList>(onGetProductList);
  }

  void onGetProductList(
      GetProductList event, Emitter<ProductListState> emit) async {
    GetProductListParams params =
        GetProductListParams(limit: event.limit, skip: event.skip);
    final dataState = await _getProductListUseCase(params: params);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print('successed');
      print(dataState.data);
      emit(ProductListLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.exception!.error);
      emit(ProductListErrorState(dataState.exception!));
    }
  }
}
