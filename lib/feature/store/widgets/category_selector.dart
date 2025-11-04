import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../model/category.dart';


class CategorySelector extends StatelessWidget {
  final List<Category> categories;
  final ValueNotifier<String> selectedCategoryNotifier;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategoryNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return ValueListenableBuilder<String>(
            valueListenable: selectedCategoryNotifier,
            builder: (context, selectedName, child) {
              final isSelected = category.name == selectedName;
              return GestureDetector(
                onTap: () {
                  selectedCategoryNotifier.value = category.name;
                },
                child: Container(
                  width: 80.w,
                  margin: EdgeInsets.only(right: 12.w),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color:  Colors.white,
                          shape: BoxShape.circle,
                          border: isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
                          boxShadow: isSelected ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),

                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 0),
                            ),
                          ] : [],
                        ),
                  child: Image.asset(
                    height: 40.h,
                    width: 40.w,
                    category.image,
                  ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? AppColors.primary : Colors.black54,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}