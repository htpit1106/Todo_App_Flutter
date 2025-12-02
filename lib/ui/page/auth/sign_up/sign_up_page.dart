import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/page/auth/sign_up/sign_up_navigator.dart';
import 'package:todo_app/ui/page/auth/sign_up/sign_up_provider.dart';
import 'package:todo_app/ui/widgets/app_text_form_field.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => SignUpProvider(), child: SignUpChildPage());
  }
}

class SignUpChildPage extends StatefulWidget {
  const SignUpChildPage({super.key});

  @override
  State<SignUpChildPage> createState() => _SignUpChildPageState();
}

class _SignUpChildPageState extends State<SignUpChildPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SignUpProvider>();
    final navigator = SignUpNavigator(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: _formKey,
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
              AppTextFormField(
                obscureText: true,
                controller: confirmPasswordTextController,
                hintText: "confirm password",
                onChange: provider.setConfirmPassword,
              ),
              const SizedBox(height: 16),
              ButtonPurple(
                textButton: "Sign Up",
                onTap: () {
                  provider.signUp();
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      navigator.goLogin(context);
                    },
                    child: Text("Log In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
