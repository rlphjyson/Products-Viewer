import 'package:products_viewer/core/resources/data_state.dart';
import 'package:products_viewer/core/usecases/usecase.dart';
import 'package:products_viewer/features/products/domain/entities/product_list.dart';
import 'package:products_viewer/features/products/domain/repository/product_repository.dart';

class GetProductListUseCase
    implements
        Usecase<DataState<List<ProductListEntity>>, GetProductListParams?> {
  final ProductRepository _productRepository;

  GetProductListUseCase(this._productRepository);

  @override
  Future<DataState<List<ProductListEntity>>> call(
      {GetProductListParams? params}) {
    return _productRepository.getProductList(
        params?.limit ?? 10, params?.skip ?? 1);
  }
}

class GetProductListParams {
  final int? skip;
  final int? limit;
  const GetProductListParams({this.skip, this.limit});
}
