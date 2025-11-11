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
                  style: TextStyle(fontSize: 14.sp, color: AppColors.primary),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 240.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: subCategory.products.length,
              itemBuilder: (context, index) {
                final product = subCategory.products[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}