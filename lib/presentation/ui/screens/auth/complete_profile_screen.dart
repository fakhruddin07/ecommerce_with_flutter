import 'package:ecommerce_with_flutter/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utility/image_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  ImageAssets.craftyBayLogoSvg,
                  width: 100,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Complete Profile",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 5),
              Text(
                "Get started with us by share your details",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 25),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "First Name"
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Last Name"
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Mobile"
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "City Name"
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Shipping Address",
                  contentPadding: EdgeInsets.all(16)
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      OtpVerificationScreen(email: '',),
                    );
                  },
                  child: const Text("Complete"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
