import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../core/utils/colors.dart';
import '../model/product.dart';
import '../notifiers/cart_notifier.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map<String, int>>(
      valueListenable: cartNotifier,
      builder: (context, cart, child) {
        final quantity = cart[product.id] ?? 0;
        final bool inCart = quantity > 0;

        return Container(
          width: 150.w,
          margin: EdgeInsets.only(right: 12.w),
          child: Card(
            color: AppColors.white,
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 120.h,
                      width: double.infinity,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),

                    if (!inCart)
                      Positioned(
                        top: 8.r,
                        right: 8.r,
                        child: _buildAddButton(product.id),
                      )
                    else
                      Positioned(
                        top: 8.r,
                        right: 8.r,
                        child: _buildVerticalCounter(quantity, product.id),
                      ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${product.price.toStringAsFixed(0)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.h),
                          ),
                          Text(
                            product.weight,
                            style: TextStyle(
                                fontSize: 12.sp, color: AppColors.textGrey),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h),
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 15.h),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildAddButton(String productId) {
    return GestureDetector(
      onTap: () => addItemToCart(productId),
      child: DottedBorder(
        options: CircularDottedBorderOptions(
          dashPattern: const [3.0, 4.0],

          strokeWidth: 2,
          color: AppColors.primary,
          padding: EdgeInsets.zero,
        ),

        child: Container(
          width: 30.w,
          height: 30.w,
          decoration: const BoxDecoration(
            color: AppColors.iconshade,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.primary,
            size: 20,
          ),
        ),
      ),
    );
  }


  Widget _buildVerticalCounter(int quantity, String productId) {
    return Container(
      width: 40.w,
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.primary , width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => addItemToCart(productId),
            child: const Icon(Icons.add, color: AppColors.primary),
          ),
          Text(
            '$quantity',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          InkWell(
            onTap: () => removeItemFromCart(productId),
            child: Icon(
              quantity == 1 ? Icons.delete : Icons.remove,
              color: Colors.red,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}