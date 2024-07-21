import 'dart:io';

import 'package:dio/dio.dart';
import 'package:products_viewer/core/resources/data_state.dart';
import 'package:products_viewer/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:products_viewer/features/products/data/models/product_model.dart';
import 'package:products_viewer/features/products/domain/entities/product_list.dart';
import 'package:products_viewer/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsApiService _productsApiService;

  ProductRepositoryImpl(this._productsApiService);

  @override
  Future<DataState<ProductModel>> getSingleProduct(int id) async {
    try {
      final httpResponse = await _productsApiService.getSingleProduct(
        id: id,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ProductListEntity>>> getProductList(
    int limit,
    int skip,
  ) async {
    try {
      final httpResponse = await _productsApiService.getProductsList(
        limit: limit,
        skip: skip,
        select: '''title,price,thumbnail,stock,discountPercentage''',
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
