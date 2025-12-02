import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/ui/page/auth/sign_in/log_in_navigator.dart';
import 'package:todo_app/ui/page/auth/sign_in/log_in_provider.dart';

import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/button_purple.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => LogInProvider(), child: LogInChildPage());
  }
}

class LogInChildPage extends StatefulWidget {
  const LogInChildPage({super.key});

  @override
  State<LogInChildPage> createState() => _LogInChildPageState();
}

class _LogInChildPageState extends State<LogInChildPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController fullNameTextController = TextEditingController();
    final TextEditingController passwordTextController = TextEditingController();
    final provider = context.read<LogInProvider>();
    final navigator = LogInNavigator(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 156),
              Image.asset("assets/images/imag_log.png", height: 128, width: 128, fit: BoxFit.cover),

              const SizedBox(height: 28),
              AppTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: fullNameTextController,
                hintText: "Email",
                onChange: provider.setEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),

              // password
              AppTextFormField(
                obscureText: true,
                controller: passwordTextController,
                hintText: "password",
                onChange: provider.setPassword,
              ),

              // confirm password
              const SizedBox(height: 16),
              ButtonPurple(textButton: "Login", onTap: () async {
                await provider.signIn();
                navigator.goHome();

              }),
              const SizedBox(height: 24),
              _buildSignInWidget(navigator),
              const SizedBox(height: 24),
              TextButton(onPressed: () {
                navigator.goHome();
              }, child: Text("Anonymous Login", style: AppTextStyle.bodyMedium,)),
            ],
          ),
        ),
      ),
    );
  }

  _buildSignInWidget(LogInNavigator navigator) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {
          navigator.goSignUp();
        }, child: Text("Sign Up")),
        SizedBox(width: 10),
        TextButton(onPressed: () {}, child: Text("Forgot Password")),
      ],
    );
  }
}
