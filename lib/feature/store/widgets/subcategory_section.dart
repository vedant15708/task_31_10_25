import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_31_10_25/feature/store/widgets/product_card.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/colors.dart';
import '../model/subcategory.dart';

class SubCategorySection extends StatelessWidget {
  final SubCategory subCategory;

  const SubCategorySection({
    super.key,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sectionBackground,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subCategory.name,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  AppConstants.moreText,
                  style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16.w, right: 60.w),
                  clipBehavior: Clip.none,

                  itemCount: subCategory.products.length,
                  itemBuilder: (context, index) {
                    final product = subCategory.products[index];
                    return ProductCard(product: product);
                  },
                ),
              ),

              Positioned(
                right: 16.w,
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: AppColors.primary,
                    size: 18.sp,
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}