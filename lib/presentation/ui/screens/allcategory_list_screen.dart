import 'package:ecommerce_with_flutter/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_with_flutter/presentation/ui/widgets/home/all_category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoryListScreen extends StatefulWidget {
  const AllCategoryListScreen({super.key});

  @override
  State<AllCategoryListScreen> createState() => _AllCategoryListScreenState();
}

class _AllCategoryListScreenState extends State<AllCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "All Category",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black54,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16
            ),
            itemBuilder: (context, index) {
              return const FittedBox(child: AllCategoryCard(),);
            },
          ),
        ),
      ),
    );
  }
}
