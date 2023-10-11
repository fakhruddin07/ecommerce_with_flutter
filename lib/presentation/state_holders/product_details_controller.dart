import 'package:ecommerce_with_flutter/data/models/network_response.dart';
import 'package:ecommerce_with_flutter/data/models/product_details.dart';
import 'package:ecommerce_with_flutter/data/models/product_details_model.dart';
import 'package:ecommerce_with_flutter/data/services/network_caller.dart';
import 'package:ecommerce_with_flutter/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMessage = "";
  final List<String> _availableColor = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;
  ProductDetails get productDetails => _productDetails;
  String get errorMessage => _errorMessage;
  List<String> get availableColor => _availableColor;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductDetails(id));

    _getProductDetailsInProgress = false;

    if (response.isSuccess) {
      _productDetails =
          ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      _convertStringToColor(_productDetails.color ?? "");
      update();
      return true;
    } else {
      _errorMessage = "Fetch product details has been failed! Try again";
      update();
      return false;
    }
  }

  void _convertStringToColor(String color) {
    List<String> splitColors = color.split(",");
    for (String c in splitColors) {
      if (c.isNotEmpty) {
        _availableColor.add(c);
      }
    }
  }
}
