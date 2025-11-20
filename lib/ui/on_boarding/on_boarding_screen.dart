import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';
import 'package:todo_app/common/app_images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Image.asset(AppImages.onboardingImg, height: 128, width: 128, fit: BoxFit.cover,))
    );
  }
}
