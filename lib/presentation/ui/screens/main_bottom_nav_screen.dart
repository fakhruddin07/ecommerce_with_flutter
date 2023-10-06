import 'package:ecommerce_with_flutter/presentation/state_holders/category_controller.dart';
import 'package:ecommerce_with_flutter/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_with_flutter/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_with_flutter/presentation/state_holders/product_controller.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/allcategory_list_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/cart_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/home_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/wish_list_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screen = const [
    HomeScreen(),
    AllCategoryListScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      Get.find<HomeSlidersController>().getHomeSliders();
      Get.find<CategoryController>().getCategories();
      Get.find<ProductController>().getPopularProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screen[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            elevation: 4,
            currentIndex: controller.currentSelectedIndex,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: "Wishlist"),
            ],
          ),
        );
      }
    );
  }
}
