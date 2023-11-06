import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_with_flutter/application/state_holder_binder.dart';
import 'package:ecommerce_with_flutter/presentation/ui/screens/splash_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  late final StreamSubscription _connectivityStatusStream;
  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();
    super.initState();
  }

  void checkInitialInternetConnection() async{
    final result = await Connectivity().checkConnectivity();
    handlerConnectivityStatus(result);
  }

  void checkInternetConnectivityStatus() {
    _connectivityStatusStream = Connectivity().onConnectivityChanged.listen(
      (status) {
        handlerConnectivityStatus(status);
      },
    );
  }

  void handlerConnectivityStatus(ConnectivityResult status){
    if (status != ConnectivityResult.mobile &&
        status != ConnectivityResult.wifi) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "No Internet",
          message: "You are currently offline",
          isDismissible: false,
        ),
      );
    }else{
      if(Get.isSnackbarOpen){
        Get.closeAllSnackbars();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 13),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 13),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }

  @override
  void dispose() {
    _connectivityStatusStream.cancel();
    super.dispose();
  }
}
