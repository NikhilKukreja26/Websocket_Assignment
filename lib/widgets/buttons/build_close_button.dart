import 'package:flutter/material.dart';
import 'package:websocket_assignment/resources/values_manager.dart';

/// Creates a Custom Close Button Widget.
class BuildCloseButton extends StatelessWidget {
  const BuildCloseButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.r50),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: Tooltip(
          message: 'Close',
          child: Icon(
            Icons.close,
            size: AppHeight.h26,
          ),
        ),
      ),
    );
  }
}
