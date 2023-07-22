import 'package:flutter/material.dart';

class BuildCustomTextFormField extends StatelessWidget {
  const BuildCustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.validator,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none,
      ),
      autocorrect: false,
      validator: validator,
    );
  }
}
