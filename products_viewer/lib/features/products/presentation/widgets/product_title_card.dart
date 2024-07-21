import 'package:flutter/material.dart';
import 'package:products_viewer/core/constants/colors.dart';
import 'package:products_viewer/features/products/domain/entities/product.dart';

class ProductTitleCard extends StatefulWidget {
  final ProductEntity? product;
  const ProductTitleCard({super.key, required this.product});

  @override
  State<ProductTitleCard> createState() => _ProductTitleCardState();
}

class _ProductTitleCardState extends State<ProductTitleCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Text(
                        widget.product?.title ?? '',
                        style: const TextStyle(
                            color: ThemeColors.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '\$${widget.product?.price.toString() ?? ''}',
                      style: const TextStyle(
                          color: ThemeColors.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Brand:${widget.product?.brand ?? ''}",
                        style: const TextStyle(
                            color: ThemeColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '${widget.product?.stock ?? ''} in stock',
                      style: const TextStyle(
                          color: ThemeColors.secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
