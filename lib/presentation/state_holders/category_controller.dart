import 'package:ecommerce_with_flutter/data/models/category_model.dart';
import 'package:ecommerce_with_flutter/data/models/network_response.dart';
import 'package:ecommerce_with_flutter/data/services/network_caller.dart';
import 'package:ecommerce_with_flutter/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  bool _getCategoriesInProgress = false;
  CategoryModel _categoryModel = CategoryModel();
  String _message = "";

  bool get getCategoriesInProgress => _getCategoriesInProgress;
  CategoryModel get categoryModel => _categoryModel;
  String get message => _message;

  Future<bool> getCategories() async{
    _getCategoriesInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getCategories);

    _getCategoriesInProgress=false;

    if(response.isSuccess){
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _message = "Category list data has failed!";
      update();
      return false;
    }
  }
}