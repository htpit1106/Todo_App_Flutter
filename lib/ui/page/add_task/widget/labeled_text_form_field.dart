import 'package:flutter/material.dart';
import '../../../../common/app_text_style.dart';

class LabeledTextFormField extends StatelessWidget {
  const LabeledTextFormField({
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textLabel ?? "no title", style: AppTextStyle.bodyMedium),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly!,
          maxLines: isMultiLine! ? null : 1,
          minLines: minLine ?? 1,
          keyboardType: keyboardType ?? TextInputType.none,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hint: Text(hintText ?? "hint??", style: AppTextStyle.bodySmall),
            suffixIcon: icPosition != null ? Image.asset(icPosition!) : null,
          ),
        ),
      ],
    );
  }
}
