import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/ui/on_boarding/splash_navigator.dart';
import '../page/home/home_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashNavigator _navigator;

  @override
  void initState() {
    super.initState();
    _navigator = SplashNavigator(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_){
      _navigator.openHome();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Image.asset(AppImages.onboardingImg, height: 128, width: 128, fit: BoxFit.cover,))
    );
  }
}
