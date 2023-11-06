import 'package:ecommerce_with_flutter/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_with_flutter/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../state_holders/otp_verification_controller.dart';
import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                child: SvgPicture.asset(
                  ImageAssets.craftyBayLogoSvg,
                  width: 100,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Enter OTP Code",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 5),
              Text(
                "A 6 Digit OTP Code has been Sent",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 25),
              PinCodeTextField(
                controller: _otpTEController,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.primaryColor,
                  selectedColor: Colors.green,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                }, appContext: context,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<OtpVerificationController>(
                    builder: (controller) {
                      if(controller.otpVerificationInProgress){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                        onPressed: () {
                          verifyOtp(controller);
                        },
                        child: const Text("Next"),
                      );
                    }
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(text: "This Code will expire in "),
                    TextSpan(
                      text: "120s",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                    onPressed: () {
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                    ),
                    child: const Text("Resend Code"),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response =
    await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if (response) {
      Get.offAll(() => const MainBottomNavScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Otp verification failed! Try again"),
          ),
        );
      }
    }
  }
}
