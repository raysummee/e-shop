import 'package:eshop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.product, required this.isDiscountAvail});
  final ProductModel product;
  final bool isDiscountAvail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.thumbnail,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.desc,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
              maxLines: 3,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    decoration: isDiscountAvail? TextDecoration.lineThrough: null,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromRGBO(128, 128, 128, 1)
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                isDiscountAvail? Text(
                  "\$${product.discountedPrice}",
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ): const SizedBox(),
                isDiscountAvail? const SizedBox(
                  width: 5,
                ): const SizedBox(),
                isDiscountAvail? Text(
                  "${product.discountPercentage}% off",
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(21, 249, 17, 1)
                  ),
                ): const SizedBox(),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}