import 'package:ecommerce_with_flutter/presentation/ui/screens/splash_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors().color),
      ),
      home: const SplashScreen(),
    );
  }
}
