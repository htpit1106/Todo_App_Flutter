import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/ui/page/auth/sign_in/log_in_navigator.dart';
import 'package:todo_app/ui/page/auth/sign_in/log_in_provider.dart';
import 'package:todo_app/ui/widgets/app_text_form_field.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/utils/app_validator.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LogInProvider(navigator: LogInNavigator(context: context)),
      child: LogInChildPage(),
    );
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
    final provider = context.read<LogInProvider>();
    final formKey = GlobalKey<FormState>();

    final TextEditingController emailTextController = TextEditingController(text: provider.email);
    final TextEditingController passwordTextController = TextEditingController(
      text: provider.password,
    );

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const ClampingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 156),
                    Image.asset(AppImages.loginImg, height: 128, width: 128, fit: BoxFit.cover),

                    const SizedBox(height: 28),
                    AppTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailTextController,
                      hintText: S.of(context).hint_email,
                      onChange: provider.setEmail,
                      validator: (value) => AppValidator.validateEmail(
                        value,
                        S.of(context).valid_email_required,
                        S.of(context).valid_email_format,
                      ),
                    ),

                    // password
                    AppTextFormField(
                      obscureText: true,
                      controller: passwordTextController,
                      hintText: S.of(context).hint_password,
                      onChange: provider.setPassword,
                      validator: (value) =>
                          AppValidator.validatePassword(value, S.of(context).valid_password_enter),
                    ),

                    // confirm password
                    const SizedBox(height: 16),
                    ButtonPurple(
                      textButton: S.of(context).button_login,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          provider.signIn();
                        }
                        //
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildSignInWidget(provider),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  _buildSignInWidget(LogInProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            provider.onPressSignup();
          },
          child: Text(S.of(context).button_sign_up),
        ),
        SizedBox(width: 10),
        TextButton(onPressed: () {}, child: Text(S.of(context).button_forgot_password)),
      ],
    );
  }
}
