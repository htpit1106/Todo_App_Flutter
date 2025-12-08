import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/services/notification_service.dart';
import 'package:todo_app/ui/splash/splash_navigator.dart';
import 'package:todo_app/ui/splash/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return SplashProvider(navigator: SplashNavigator(context: context));
      },
      child: SplashScreenChild(),
    );
  }
}

class SplashScreenChild extends StatefulWidget {
  const SplashScreenChild({super.key});

  @override
  State<SplashScreenChild> createState() => _SplashScreenChildState();
}

class _SplashScreenChildState extends State<SplashScreenChild> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().autoLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppImages.splashImg, height: 128, width: 128, fit: BoxFit.cover)),
    );
  }
}
