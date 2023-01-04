import 'package:eshop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key, required this.product, required this.isDiscountAvail});
  final ProductModel product;
  final bool isDiscountAvail;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> with TickerProviderStateMixin{

  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animationController.animateTo(0.2);
        Future.delayed(const Duration(milliseconds: 500), () {
          animationController.animateTo(0);
        },);
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder:(context, child)=> Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(animationController.value),
                blurRadius: 10
              )
            ]
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
                      widget.product.thumbnail,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.product.title,
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
                  widget.product.desc,
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
                      "\$${widget.product.price}",
                      style: TextStyle(
                        decoration: widget.isDiscountAvail? TextDecoration.lineThrough: null,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: const Color.fromRGBO(128, 128, 128, 1)
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    widget.isDiscountAvail? Text(
                      "\$${widget.product.discountedPrice}",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ): const SizedBox(),
                    widget.isDiscountAvail? const SizedBox(
                      width: 5,
                    ): const SizedBox(),
                    widget.isDiscountAvail? Text(
                      "${widget.product.discountPercentage}% off",
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
        ),
      ),
    );
  }
}