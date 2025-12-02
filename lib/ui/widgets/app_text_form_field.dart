import 'package:flutter/material.dart';
import '../../common/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.textLabel,
    this.hintText,
    required this.controller,
    this.minLine,
    this.isMultiLine = false,
    this.keyboardType,
    this.icPosition,
    this.readOnly = false,
    this.validator,
    this.onTap,
    this.onChange,
    this.obscureText
  });

  final String? textLabel;
  final String? hintText;
  final int? minLine;

  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? isMultiLine;
  final String? icPosition;
  final bool? readOnly;
  final String? Function(String? value)? validator;
  final VoidCallback? onTap;
  final Function(String value)? onChange;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textLabel ?? "", style: AppTextStyle.bodyMedium,),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly!,
          maxLines: isMultiLine! ? null : 1,
          minLines: minLine ?? 1,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          validator: validator,
          onChanged: onChange,
          obscureText: obscureText?? false,
          decoration: InputDecoration(
            hint: Text(hintText ?? "", style: AppTextStyle.bodySmall),
            suffixIcon: icPosition != null ? Image.asset(icPosition!) : null,
          ),
        ),
      ],
    );
  }
}
