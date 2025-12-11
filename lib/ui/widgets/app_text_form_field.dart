import 'package:flutter/material.dart';
import 'package:todo_app/common/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.textLabel,
    this.hintText,
    required this.controller,
    this.minLine,
    this.isMultiLine = false,
    this.keyboardType,
    this.icSuffix,
    this.readOnly = false,
    this.validator,
    this.onTap,
    this.onChange,
    this.obscureText,
    this.icPrefix
  });

  final String? textLabel;
  final String? hintText;
  final int? minLine;

  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? isMultiLine;
  final String? icSuffix;
  final bool? readOnly;
  final String? Function(String? value)? validator;
  final VoidCallback? onTap;
  final Function(String value)? onChange;
  final bool? obscureText;
  final IconData? icPrefix;
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
            prefixIcon: icPrefix != null ? Icon(icPrefix) : null,
            hint: Text(hintText ?? "", style: AppTextStyle.bodySmall),
            suffixIcon: icSuffix != null ? Image.asset(icSuffix!) : null,
          ),
        ),
      ],
    );
  }
}
