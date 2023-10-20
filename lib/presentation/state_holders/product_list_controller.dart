import 'package:ecommerce_with_flutter/data/models/network_response.dart';
import 'package:ecommerce_with_flutter/data/models/product_model.dart';
import 'package:ecommerce_with_flutter/data/services/network_caller.dart';
import 'package:ecommerce_with_flutter/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool _getProductsInProgress = false;
  ProductModel _productModel = ProductModel();
  String _message = "";

  bool get getProductsInProgress => _getProductsInProgress;
  ProductModel get productModel => _productModel;
  String get message => _message;

  Future<bool> getProductsByCategory(int categoryId) async {
    _getProductsInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByCategory(categoryId));

    _getProductsInProgress = false;

    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = "Product list data has failed!";
      update();
      return false;
    }
  }
}
