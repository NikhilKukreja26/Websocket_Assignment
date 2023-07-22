import 'package:flutter/material.dart'
    show BuildContext, Widget, showModalBottomSheet;

void showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (context) => child,
  );
}
