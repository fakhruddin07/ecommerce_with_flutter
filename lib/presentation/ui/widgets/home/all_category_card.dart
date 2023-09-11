import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class AllCategoryCard extends StatelessWidget {
  const AllCategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.shopping_cart,
              size: 32,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Electronics",
            style: TextStyle(
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