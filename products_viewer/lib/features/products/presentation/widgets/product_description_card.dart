import 'package:flutter/material.dart';
import 'package:products_viewer/core/constants/colors.dart';
import 'package:products_viewer/features/products/domain/entities/product.dart';

class ProductDescriptionCard extends StatelessWidget {
  final ProductEntity? product;
  const ProductDescriptionCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 470,
        width: double.infinity,
        child: Card(
          color: ThemeColors.primary,
          elevation: 10,
          shadowColor: Colors.black,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Item Description',
                  style: TextStyle(
                      color: ThemeColors.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Desc
                const Text(
                  '• Description',
                  style: TextStyle(
                      color: ThemeColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product?.description ?? '',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                //Category
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Category',
                  style: TextStyle(
                      color: ThemeColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.category ?? ''}',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                //dimensions
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Dimensions (mm)',
                  style: TextStyle(
                      color: ThemeColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.dimensions?['width']}x${product?.dimensions?['height']}x${product?.dimensions?['depth']}',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                //warranty info
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Warranty Information',
                  style: TextStyle(
                      color: ThemeColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.warrantyInformation ?? ''}',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                //warranty info
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Shipping Information',
                  style: TextStyle(
                      color: ThemeColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.shippingInfomation ?? ''}',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                //warranty info
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Return Policy',
                  style: TextStyle(
                      color: ThemeColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.returnPolicy ?? ''}',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ));
  }
}
