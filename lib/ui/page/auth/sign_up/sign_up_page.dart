import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/ui/page/auth/sign_up/sign_up_navigator.dart';
import 'package:todo_app/ui/page/auth/sign_up/sign_up_provider.dart';
import 'package:todo_app/ui/widgets/app_text_form_field.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/utils/app_validator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => SignUpProvider(
      navigator: SignUpNavigator(context: context),
      profileRepo: context.read<ProfileRepository>()

    ), child: SignUpChildPage());
  }
}

class SignUpChildPage extends StatefulWidget {
  const SignUpChildPage({super.key});

  @override
  State<SignUpChildPage> createState() => _SignUpChildPageState();
}

class _SignUpChildPageState extends State<SignUpChildPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();
  final TextEditingController fullNameTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignUpProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Image.asset(AppImages.signupImg, height: 128, width: 128, fit: BoxFit.cover),

              const SizedBox(height: 28),
              AppTextFormField(

                controller: fullNameTextController,
                hintText: S.of(context).hint_full_name,
                onChange: provider.setName,
                validator: (value) => AppValidator.validateEmpty(value, S.of(context).valid_field_empty),
              ),
              AppTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailTextController,
                hintText: S.of(context).hint_email,
                onChange: provider.setEmail,
                validator: (value) => AppValidator.validateEmail(value, S.of(context).valid_email_enter, S.of(context).valid_email_format),
              ),

              // password
              AppTextFormField(
                obscureText: true,
                controller: passwordTextController,
                hintText: S.of(context).hint_password,
                onChange: provider.setPassword,
                validator: (value) => AppValidator.validatePassword(value, S.of(context).valid_password_enter),
              ),
              // confirm password
              AppTextFormField(
                obscureText: true,
                controller: confirmPasswordTextController,
                hintText: S.of(context).hint_confirm_password,
                onChange: provider.setConfirmPassword,
                validator: (value) => AppValidator.validateConfirmPassword(value, passwordTextController.text, S.of(context).valid_confirm_password_enter, S.of(context).valid_confirm_password_mismatch),
              ),
              const SizedBox(height: 16),
              ButtonPurple(
                textButton: S.of(context).button_sign_up,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    provider.signUp();
                  }
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      provider.goLogin();
                    },
                    child: Text(S.of(context).button_log_in),
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
