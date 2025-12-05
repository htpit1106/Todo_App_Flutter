import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/router/app_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingChildPage();
  }
}

class OnboardingChildPage extends StatefulWidget {
  const OnboardingChildPage({super.key});

  @override
  State<OnboardingChildPage> createState() => _OnboardingChildPageState();
}

class _OnboardingChildPageState extends State<OnboardingChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // --- Ảnh minh hoạ ---
              Expanded(
                child: Image.asset(
                  AppImages.onboardingImg,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),


              Text(
                "Quản lý công việc dễ dàng",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // --- Mô tả ---
              Text(
                "Tạo, theo dõi và hoàn thành các công việc mỗi ngày một cách đơn giản.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 30),

              // --- Nút bắt đầu ---
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    context.goNamed(AppRouter.logIn);
                  },
                  child: const Text(
                    "Bắt đầu",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
