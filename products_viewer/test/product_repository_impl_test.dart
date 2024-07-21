import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_viewer/core/resources/data_state.dart';
import 'package:products_viewer/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:products_viewer/features/products/data/models/product_model.dart';
import 'package:products_viewer/features/products/data/repository/product_repository_impl.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  late ProductRepositoryImpl productRepositoryImpl;
  late DioAdapterMock dioAdapterMock;
  late ProductsApiService productsApiService;
  final Dio dio = Dio();
  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    productsApiService = ProductsApiService(dio);
    productRepositoryImpl = ProductRepositoryImpl(productsApiService);
  });
  group('Product Repository Impl-', () {
    group('getSingleProduct Funtion', () {
      test(
          'given ProductRepositoryImpl class when getSingleProduct function is called and status is 200 then it should return DataSuccess with ProductModel',
          () async {
        final res = await productRepositoryImpl.getSingleProduct(1);
        expect(res, isA<DataSuccess<ProductModel>>());
      });
      test(
          'given ProductRepositoryImpl class when getSingleProduct function is called and status is not 200 then it should return DataFailed with DioException',
          () async {
        final res = await productRepositoryImpl.getSingleProduct(1);
        expect(res, isA<DataFailed<DioException>>());
      });
    });
  });
}
