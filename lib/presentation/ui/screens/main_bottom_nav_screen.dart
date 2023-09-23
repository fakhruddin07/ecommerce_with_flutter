import 'package:ecommerce_with_flutter/presentation/ui/screens/allcategory_list_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/home_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/wish_list_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screen = const [
    HomeScreen(),
    AllCategoryListScreen(),
    HomeScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        elevation: 4,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
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
}
