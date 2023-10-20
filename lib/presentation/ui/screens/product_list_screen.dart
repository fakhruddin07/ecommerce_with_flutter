import 'package:ecommerce_with_flutter/presentation/state_holders/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;
  const ProductListScreen({super.key, required this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>()
          .getProductsByCategory(widget.categoryId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Category",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: GetBuilder<ProductListController>(builder: (productListController) {
        if (productListController.getProductsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(productListController.productModel.data?.isEmpty ?? true){
          return const Center(
            child: Text("Empty List"),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            itemCount: productListController.productModel.data?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                child: ProductCard(
                  product: productListController.productModel.data![index],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
