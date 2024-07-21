import 'package:products_viewer/core/constants/constants.dart';
import 'package:products_viewer/features/products/data/models/product_list_model.dart';
import 'package:products_viewer/features/products/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'product_api_service.g.dart';

@RestApi(baseUrl: productsAPIBaseURL)
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio) = _ProductsApiService;

  @GET('/products')
  Future<HttpResponse<List<ProductListModel>>> getProductsList({
    @Query("limit") int? limit,
    @Query("skip") int? skip,
    @Query("select") String? select,
  });

  @GET('/products/{id}')
  Future<HttpResponse<ProductModel>> getSingleProduct({
    @Path("id") int? id,
  });
}
