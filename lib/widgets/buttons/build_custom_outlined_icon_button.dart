import 'package:flutter/material.dart';
import 'package:websocket_assignment/resources/values_manager.dart';

class BuildCustomOutlinedIconButton extends StatelessWidget {
  const BuildCustomOutlinedIconButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.add,
        size: AppHeight.h16,
      ),
      label: Text(text),
    );
  }
}
