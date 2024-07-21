import 'package:products_viewer/core/resources/data_state.dart';
import 'package:products_viewer/features/products/domain/entities/product.dart';
import 'package:products_viewer/features/products/domain/entities/product_list.dart';

abstract class ProductRepository {
  Future<DataState<ProductEntity>> getSingleProduct(int id);
  Future<DataState<List<ProductListEntity>>> getProductList(
      int limit, int skip);
}
