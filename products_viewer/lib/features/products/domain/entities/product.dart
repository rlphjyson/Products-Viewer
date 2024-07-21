import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final int? stock;
  final List<dynamic>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Map<String, dynamic>? dimensions;
  final String? warrantyInformation;
  final String? shippingInfomation;

  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final List<dynamic>? images;
  final String? thumbnail;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      category,
      price,
      discountPercentage,
      stock,
      tags,
      brand,
      sku,
      weight,
      dimensions,
      warrantyInformation,
      shippingInfomation,
      returnPolicy,
      minimumOrderQuantity,
      images,
      thumbnail
    ];
  }

  const ProductEntity(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.dimensions,
      this.warrantyInformation,
      this.shippingInfomation,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.images,
      this.thumbnail});
}
