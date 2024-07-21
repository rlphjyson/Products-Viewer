import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:products_viewer/features/products/domain/entities/product_list.dart';

abstract class ProductListState extends Equatable {
  final List<ProductListEntity>? productList;
  final DioException? exception;

  const ProductListState({this.productList, this.exception});

  @override
  List<Object> get props => [
        productList ?? [],
        exception ?? DioException(requestOptions: RequestOptions(data: []))
      ];
}

class ProductListLoadingState extends ProductListState {
  const ProductListLoadingState();
}

class ProductListLoadedState extends ProductListState {
  const ProductListLoadedState(List<ProductListEntity> productList)
      : super(productList: productList);
}

class ProductListErrorState extends ProductListState {
  const ProductListErrorState(DioException exception)
      : super(exception: exception);
}
