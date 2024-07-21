import 'package:products_viewer/features/products/domain/entities/product_list.dart';

class ProductListModel extends ProductListEntity {
  const ProductListModel({
    int? id,
    String? title,
    double? price,
    String? thumbnail,
    int? stock,
    double? discountPercentage,
  }) : super(
          id: id,
          title: title,
          price: price,
          thumbnail: thumbnail,
          stock: stock,
          discountPercentage: discountPercentage,
        );

  factory ProductListModel.fromJson(Map<String, dynamic> map) {
    return ProductListModel(
      id: map["id"] ?? 1,
      title: map['title'] ?? "",
      price: map['price'] ?? 0.0,
      thumbnail: map['thumbnail'] ?? "",
      stock: map['stock'] ?? 0,
      discountPercentage: map['discountPercentage'].runtimeType == int
          ? int.parse(map['discountPercentage'].toString()).toDouble()
          : map['discountPercentage'] ?? 0.0,
    );
  }
}
