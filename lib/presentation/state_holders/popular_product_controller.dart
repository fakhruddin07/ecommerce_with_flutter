import 'package:ecommerce_with_flutter/data/models/network_response.dart';
import 'package:ecommerce_with_flutter/data/models/product_model.dart';
import 'package:ecommerce_with_flutter/data/services/network_caller.dart';
import 'package:ecommerce_with_flutter/data/utility/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductsInProgress = false;
  bool _getSpecialProductsInProgress = false;
  bool _getNewProductsInProgress = false;
  ProductModel _popularProductModel = ProductModel();
  ProductModel _specialProductModel = ProductModel();
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = "";

  bool get getPopularProductsInProgress => _getPopularProductsInProgress;
  bool get getSpecialProductsInProgress => _getSpecialProductsInProgress;
  bool get getNewProductsInProgress => _getNewProductsInProgress;

  ProductModel get popularProductModel => _popularProductModel;
  ProductModel get specialProductModel => _specialProductModel;
  ProductModel get newProductModel => _newProductModel;
  String get errorMessage => _errorMessage;

  Future<bool> getPopularProduct() async {
    _getPopularProductsInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getProductsByRemark("popular"),
    );
    _getPopularProductsInProgress = false;

    if (response.isSuccess) {
      _popularProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = "Popular product fetch failed! Try again";
      update();
      return false;
    }
  }

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

  Future<bool> getNewProduct() async {
    _getNewProductsInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getProductsByRemark("new"),
    );
    _getNewProductsInProgress = false;

    if (response.isSuccess) {
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = "New product fetch failed! Try again";
      update();
      return false;
    }
  }
}
