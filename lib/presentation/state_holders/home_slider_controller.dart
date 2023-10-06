import 'package:ecommerce_with_flutter/data/models/network_response.dart';
import 'package:ecommerce_with_flutter/data/models/slider_model.dart';
import 'package:ecommerce_with_flutter/data/services/network_caller.dart';
import 'package:ecommerce_with_flutter/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSlidersController extends GetxController{
  bool _getHomeSlidersInProgress = false;
  SliderModel _sliderModel = SliderModel();
  String _message = "";

  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;
  SliderModel get sliderModel => _sliderModel;
  String get message => _message;

  Future<bool> getHomeSliders() async{
    _getHomeSlidersInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getHomeSliders);

    _getHomeSlidersInProgress=false;

    if(response.isSuccess){
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}