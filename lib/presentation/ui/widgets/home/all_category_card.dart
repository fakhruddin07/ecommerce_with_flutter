import 'package:ecommerce_with_flutter/data/models/category_data.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class AllCategoryCard extends StatelessWidget {
  final CategoryData categoryData;
  const AllCategoryCard({
    super.key,
    required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryData.categoryImg ?? "",
              height: 50,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categoryData.categoryName ?? "",
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 15,
              letterSpacing: 0.5,
            ),
          )
        ],
      ),
    );
  }
}
