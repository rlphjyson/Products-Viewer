abstract class SingleProductEvent {
  const SingleProductEvent();
}

class GetSingleProduct extends SingleProductEvent {
  final int id;
  const GetSingleProduct(this.id);
}
