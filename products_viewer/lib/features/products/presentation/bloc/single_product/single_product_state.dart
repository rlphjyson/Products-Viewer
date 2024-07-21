import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:products_viewer/features/products/domain/entities/product.dart';

abstract class SingleProductState extends Equatable {
  final ProductEntity? product;
  final DioException? exception;

  const SingleProductState({this.product, this.exception});

  @override
  List<Object> get props => [
        product!,
        exception ?? DioException(requestOptions: RequestOptions(data: []))
      ];
}

class SingleProductLoadingState extends SingleProductState {
  const SingleProductLoadingState();
}

class SingleProductLoadedState extends SingleProductState {
  const SingleProductLoadedState(ProductEntity product)
      : super(product: product);
}

class SingleProductErrorState extends SingleProductState {
  const SingleProductErrorState(DioException exception)
      : super(exception: exception);
}
