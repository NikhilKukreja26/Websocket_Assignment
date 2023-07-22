import 'package:flutter/material.dart';

class BuildCustomOutlinedButton extends StatelessWidget {
  const BuildCustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
