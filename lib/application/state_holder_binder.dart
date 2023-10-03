import 'package:ecommerce_with_flutter/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';
import '../presentation/state_holders/email_verification_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
  }
}