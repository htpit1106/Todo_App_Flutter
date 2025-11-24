import 'package:flutter/material.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/ui/on_boarding/onboarding_navigator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingNavigator _navigator;
  @override
  void initState() {
    super.initState();
    _navigator = OnboardingNavigator(context: context);
    _navigator.openHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Image.asset(AppImages.onboardingImg, height: 128, width: 128, fit: BoxFit.cover,))
    );
  }
}
