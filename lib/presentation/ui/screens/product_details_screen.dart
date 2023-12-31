import 'package:ecommerce_with_flutter/data/models/product_details.dart';
import 'package:ecommerce_with_flutter/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerce_with_flutter/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_with_flutter/presentation/ui/widgets/custom_stepper.dart';
import 'package:ecommerce_with_flutter/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProductDetailsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProductImageSlider(
                            imageList: [
                              productDetailsController.productDetails.img1 ??
                                  "",
                              productDetailsController.productDetails.img2 ??
                                  "",
                              productDetailsController.productDetails.img3 ??
                                  "",
                              productDetailsController.productDetails.img4 ??
                                  "",
                            ],
                          ),
                          productDetailsAppBar,
                        ],
                      ),
                      productDetails(
                        productDetailsController.productDetails,
                        productDetailsController.availableColors,
                      ),
                    ],
                  ),
                ),
              ),
              addToCartBottomContainer(
                productDetailsController.productDetails,
                productDetailsController.availableColors,
                productDetailsController.availableSizes,
              ),
            ],
          ),
        );
      }),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              CustomStepper(
                lowerLimit: 1,
                upperLimit: 10,
                stepValue: 1,
                value: 1,
                onChange: (newValue) {
                  quantity = newValue;
                },
              )
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  Text(
                    "${productDetails.product?.star ?? 0}",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Review",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const Card(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const Text(
            "Color",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 28,
            child: SizePicker(
              sizes: productDetails.color?.split(",") ?? [],
              onSelected: (int selectedColor) {
                _selectedColorIndex = selectedColor;
              },
              initialSelected: 0,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Size",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 28,
            child: SizePicker(
              sizes: productDetails.size?.split(",") ?? [],
              onSelected: (int selectedSize) {
                _selectedSizeIndex = selectedSize;
              },
              initialSelected: 0,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Description",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Text(productDetails.des ?? ""),
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        "Product Details",
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container addToCartBottomContainer(
      ProductDetails details, List<String> colors, List<String> sizes) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "\$1000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                if (addToCartController.addToCartInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () async {
                    final result = await addToCartController.addToCart(
                      details.id!,
                      colors[_selectedColorIndex].toString(),
                      sizes[_selectedSizeIndex],
                      quantity,
                    );
                    if (result) {
                      Get.snackbar(
                        "Added to Cart",
                        "This product has been added to cart list",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: const Text("Add to Cart"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
