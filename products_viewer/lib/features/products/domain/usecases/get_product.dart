import 'package:products_viewer/core/resources/data_state.dart';
import 'package:products_viewer/core/usecases/usecase.dart';
import 'package:products_viewer/features/products/domain/entities/product.dart';
import 'package:products_viewer/features/products/domain/repository/product_repository.dart';

class GetProductUseCase implements Usecase<DataState<ProductEntity>, int?> {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  @override
  Future<DataState<ProductEntity>> call({int? params}) {
    return _productRepository.getSingleProduct(params ?? 1);
  }
}
