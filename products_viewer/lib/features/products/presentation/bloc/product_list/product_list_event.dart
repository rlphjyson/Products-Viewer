abstract class ProductListEvent {
  const ProductListEvent();
}

class GetProductList extends ProductListEvent {
  final int limit;
  final int skip;
  const GetProductList(this.limit, this.skip);
}
