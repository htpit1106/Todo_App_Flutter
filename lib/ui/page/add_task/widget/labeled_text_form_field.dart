import 'package:flutter/material.dart';

import '../../../../common/app_text_style.dart';

class LabeledTextFormField extends StatelessWidget {
  const LabeledTextFormField({super.key, this.textLabel, this.hintText, required this.controller});
  final String? textLabel;
  final String? hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textLabel ?? "no title", style: AppTextStyle.bodyMedium),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hint: Text(hintText?? "hint??", style: AppTextStyle.bodySmall),

            ),
          ),
        ],
      ),
    );
  }
}
