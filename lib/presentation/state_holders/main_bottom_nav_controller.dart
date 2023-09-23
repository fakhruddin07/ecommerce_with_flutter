import 'package:get/get.dart';

class MainBottomNavController extends GetxController{
  int currentSelectedIndex = 0;

  void changeIndex(int index){
    currentSelectedIndex = index;
    update();
  }

  void backToHome(){
    changeIndex(0);
  }
}