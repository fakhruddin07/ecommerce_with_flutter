import 'package:ecommerce_with_flutter/data/models/network_response.dart';
import 'package:ecommerce_with_flutter/data/services/network_caller.dart';
import 'package:ecommerce_with_flutter/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;
  String _errorMessage = "";

  bool get addToCartInProgress => _addToCartInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> addToCart(int productId, String color, String size) async {
    _addToCartInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.addToCart,
      {
        "product_id": productId,
        "color": color,
        "size": size,
      },
    );

    _addToCartInProgress = false;
    update();

    if(response.isSuccess){
      return true;
    }else{
      _errorMessage = "Add to cat failed! Try again";
      return false;
    }
  }
}
