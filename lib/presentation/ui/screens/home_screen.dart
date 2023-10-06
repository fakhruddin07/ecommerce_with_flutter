import 'package:ecommerce_with_flutter/presentation/state_holders/category_controller.dart';
import 'package:ecommerce_with_flutter/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_with_flutter/presentation/state_holders/product_controller.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/product_list_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/utility/image_assets.dart';
import 'package:ecommerce_with_flutter/presentation/ui/widgets/home/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home/all_category_card.dart';
import '../widgets/home/product_card.dart';
import '../widgets/home/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayNavLogoSvg),
            const Spacer(),
            CircularIconButton(
              onTap: () {},
              icon: Icons.person_2_outlined,
            ),
            const SizedBox(width: 8),
            CircularIconButton(
              onTap: () {},
              icon: Icons.call_outlined,
            ),
            const SizedBox(width: 8),
            CircularIconButton(
              onTap: () {},
              icon: Icons.notifications_active_outlined,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
            const SizedBox(height: 16),
            GetBuilder<HomeSlidersController>(
              builder: (homeSlidersController) {
                if (homeSlidersController.getHomeSlidersInProgress) {
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: homeSlidersController.sliderModel.data ?? [],
                );
              },
            ),
            SectionHeader(
              title: "All Categories",
              onTap: () {
                Get.find<MainBottomNavController>().changeIndex(1);
              },
            ),
            SizedBox(
              height: 90,
              child:
                  GetBuilder<CategoryController>(builder: (categoryController) {
                if (categoryController.getCategoriesInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: categoryController.categoryModel.data?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AllCategoryCard(
                      categoryData:
                          categoryController.categoryModel.data![index],
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            SectionHeader(
              title: "Popular",
              onTap: () {
                Get.to(const ProductListScreen());
              },
            ),
            SizedBox(
              height: 165,
              child:
                  GetBuilder<ProductController>(builder: (productController) {
                if (productController.getPopularProductsInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      productController.popularProductModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product:
                          productController.popularProductModel.data![index],
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            SectionHeader(
              title: "Special",
              onTap: () {
                Get.to(const ProductListScreen());
              },
            ),
            SizedBox(
              height: 165,
              /*child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),*/
            ),
            const SizedBox(height: 16),
            SectionHeader(
              title: "New",
              onTap: () {
                Get.to(const ProductListScreen());
              },
            ),
            SizedBox(
              height: 165,
              /*child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}
