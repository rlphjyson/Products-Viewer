import 'package:flutter/material.dart';
import 'package:products_viewer/core/constants/colors.dart';
import 'package:products_viewer/features/products/domain/entities/product_list.dart';

class ProductListCard extends StatelessWidget {
  final ProductListEntity product;
  const ProductListCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          SizedBox(
            height: 130,
            width: double.infinity,
            child: Card(
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              shadowColor: Colors.black,
              color: ThemeColors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Image
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: double.infinity,
                    width: 120,
                    child: Center(
                      child: Image.network(
                        product.thumbnail ?? '',
                        width: 75,
                        height: 75,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //Desc
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title ?? '',
                            style: const TextStyle(
                                color: ThemeColors.textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$${product.price?.toString() ?? ''}',
                                style: const TextStyle(
                                    color: ThemeColors.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Text(
                                'Stock:${product.stock?.toString() ?? ''}',
                                style: const TextStyle(
                                    color: ThemeColors.textColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 5,
              left: 0,
              child: Container(
                width: 65,
                height: 20,
                color: ThemeColors.secondary,
                child: Center(
                  child: Text(
                    '${product.discountPercentage}% OFF',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
