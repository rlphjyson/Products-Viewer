import 'package:equatable/equatable.dart';

//https://dummyjson.com/products?limit=10&skip=
//{PAGINATION_SKIP}&select=title,p
//rice,thumbnail,stock,discountPercentage

class ProductListEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? thumbnail;
  final int? stock;
  final double? discountPercentage;

  const ProductListEntity(
      {this.id,
      this.title,
      this.price,
      this.thumbnail,
      this.stock,
      this.discountPercentage});
  @override
  List<Object?> get props {
    return [id, title, price, thumbnail, stock, discountPercentage];
  }
}
