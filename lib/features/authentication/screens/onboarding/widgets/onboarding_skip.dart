import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: const Text("Skip"),
      ),
    );
  }
}
