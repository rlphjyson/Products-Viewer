import 'package:products_viewer/features/products/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {int? id,
      String? title,
      String? description,
      String? category,
      double? price,
      double? discountPercentage,
      int? stock,
      List<dynamic>? tags,
      String? brand,
      String? sku,
      int? weight,
      Map<String, dynamic>? dimensions,
      String? warrantyInformation,
      String? shippingInfomation,
      List<dynamic>? reviews,
      String? returnPolicy,
      int? minimumOrderQuantity,
      List<dynamic>? images,
      String? thumbnail})
      : super(
          id: id,
          title: title,
          description: description,
          category: category,
          price: price,
          discountPercentage: discountPercentage,
          stock: stock,
          tags: tags,
          brand: brand,
          sku: sku,
          weight: weight,
          dimensions: dimensions,
          warrantyInformation: warrantyInformation,
          shippingInfomation: shippingInfomation,
          returnPolicy: returnPolicy,
          minimumOrderQuantity: minimumOrderQuantity,
          images: images,
          thumbnail: thumbnail,
        );

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      category: map['category'] ?? "",
      price: map['price'] ?? 0,
      discountPercentage: map['discountPercentage'] ?? 0,
      stock: map['stock'] ?? 0,
      tags: map['tags'] ?? [],
      brand: map['brand'] ?? "",
      sku: map['sku'] ?? "",
      weight: map['weight'] ?? 0,
      dimensions: map['dimensions'] ?? {},
      warrantyInformation: map['warrantyInformation'] ?? "",
      shippingInfomation: map['shippingInformation'] ?? "",
      reviews: map['reviews'] ?? [],
      returnPolicy: map['returnPolicy'] ?? "",
      minimumOrderQuantity: map['minimumOrderQuantity'] ?? 0,
      images: map['images'] ?? [],
      thumbnail: map['thumbnail '] ?? "",
    );
  }
}

class ProductReview {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  ProductReview({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) {
    return ProductReview(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}
