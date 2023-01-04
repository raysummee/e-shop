import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

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
                  "https://assetscdn1.paytm.com/images/catalog/view_item/874378/1629279441968.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "iPhone 9",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "An apple mobile which is nothing like apple dasfkjds;fjds;fa  fdsfj",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
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
                  "\$549",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(128, 128, 128, 1)
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "\$499",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "12.96% off",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(21, 249, 17, 1)
                  ),
                ),
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