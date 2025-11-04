import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/colors.dart';
import '../data/store_data.dart';
import '../notifiers/cart_notifier.dart';
import '../widgets/category_selector.dart';
import '../widgets/subcategory_section.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late final ValueNotifier<String> _selectedCategoryNotifier;

  @override
  void initState() {
    super.initState();
    _selectedCategoryNotifier = ValueNotifier(mockCategories.first.name);
  }

  @override
  void dispose() {
    _selectedCategoryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            Container(
              color: AppColors.sectionBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0),
                    child: Text(
                      AppConstants.categoryTitle,
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  CategorySelector(
                    categories: mockCategories,
                    selectedCategoryNotifier: _selectedCategoryNotifier,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),

            ValueListenableBuilder<String>(
              valueListenable: _selectedCategoryNotifier,
              builder: (context, selectedCategoryName, child) {
                final selectedCategory = mockCategories.firstWhere(
                      (cat) => cat.name == selectedCategoryName,
                );

                return Column(
                  children: selectedCategory.subCategories.map((subCategory) {
                    return SubCategorySection(subCategory: subCategory);
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 280.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppConstants.storeBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          height: 280.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.6),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),

        Container(
          height: 280.h,
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Arrow
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      Text(
                        "Walmart",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildCartIcon(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                      backgroundImage: const AssetImage(
                          AppConstants.storeLogoCircle
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "3456 Washington Street, Us, 6542",
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.9),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
        _buildFloatingSearchBar(),
      ],
    );
  }

  Widget _buildFloatingSearchBar() {
    return Positioned(
      bottom: 16.h,
      left: 16.w,
      right: 16.w,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.r),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search Walmart...",
            prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          ),
        ),
      ),
    );
  }

  Widget _buildCartIcon() {
    return ValueListenableBuilder<Map<String, int>>(
      valueListenable: cartNotifier,
      builder: (context, cart, child) {
        final totalItems = cart.length;

        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: AppColors.white),
              onPressed: () {},
            ),
            if (totalItems > 0)
              Positioned(
                top: 8.r,
                right: 8.r,
                child: Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: AppColors.loginbutton,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  constraints: BoxConstraints(minWidth: 16.w, minHeight: 16.h),
                  child: Text(
                    '$totalItems',
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}