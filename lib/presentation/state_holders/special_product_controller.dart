import 'package:ecommerce_with_flutter/data/models/network_response.dart';
import 'package:ecommerce_with_flutter/data/models/product_model.dart';
import 'package:ecommerce_with_flutter/data/services/network_caller.dart';
import 'package:ecommerce_with_flutter/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductsInProgress = false;
  ProductModel _specialProductModel = ProductModel();
  String _errorMessage = "";

  bool get getSpecialProductsInProgress => _getSpecialProductsInProgress;
  ProductModel get specialProductModel => _specialProductModel;
  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProduct() async {
    _getSpecialProductsInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getProductsByRemark("special"),
    );
    _getSpecialProductsInProgress = false;

    if (response.isSuccess) {
      _specialProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = "Special product fetch failed! Try again";
      update();
      return false;
    }
  }
}
