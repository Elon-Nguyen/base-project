import 'package:flutter/material.dart';

/// Different types of Snackbar
enum SnackBarType { info, success, warning, error }

/// Class to manage Snackbar display
class CustomSnackBar {
  /// Display a custom Snackbar
  static void show({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    bool showCloseIcon = true,
    double? bottomMargin,
    VoidCallback? onVisible,
  }) {
    // Hide any currently displayed snackbar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Configure colors based on type
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    late Color backgroundColor;
    late Color iconColor;
    late IconData iconData;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green.shade800;
        iconColor = Colors.white;
        iconData = Icons.check_circle_outline;
      case SnackBarType.warning:
        backgroundColor = Colors.orange.shade800;
        iconColor = Colors.white;
        iconData = Icons.warning_amber_outlined;
      case SnackBarType.error:
        backgroundColor = Colors.red.shade800;
        iconColor = Colors.white;
        iconData = Icons.error_outline;
      case SnackBarType.info:
        backgroundColor = colorScheme.primary;
        iconColor = colorScheme.onPrimary;
        iconData = Icons.info_outline;
    }

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(iconData, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: TextStyle(color: iconColor, fontSize: 16))),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: duration,
      action:
          showCloseIcon
              ? (action ??
                  SnackBarAction(
                    label: 'Close',
                    textColor: iconColor,
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ))
              : action,
      margin:
          bottomMargin != null
              ? EdgeInsets.only(left: 16, right: 16, bottom: bottomMargin)
              : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      onVisible: onVisible,
      dismissDirection: DismissDirection.horizontal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

/// Custom SnackBar widget that can be used in any widget
class CustomSnackBarWidget extends StatelessWidget {
  const CustomSnackBarWidget({
    required this.message,
    super.key,
    this.type = SnackBarType.info,
    this.onActionPressed,
    this.actionLabel,
    this.showCloseIcon = true,
  });

  final String message;
  final SnackBarType type;
  final VoidCallback? onActionPressed;
  final String? actionLabel;
  final bool showCloseIcon;

  @override
  Widget build(BuildContext context) {
    // Configure colors based on type
    late Color backgroundColor;
    late Color textColor;
    late IconData iconData;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green.shade50;
        textColor = Colors.green.shade900;
        iconData = Icons.check_circle;
      case SnackBarType.warning:
        backgroundColor = Colors.orange.shade50;
        textColor = Colors.orange.shade900;
        iconData = Icons.warning_amber;
      case SnackBarType.error:
        backgroundColor = Colors.red.shade50;
        textColor = Colors.red.shade900;
        iconData = Icons.error;
      case SnackBarType.info:
        backgroundColor = Colors.blue.shade50;
        textColor = Colors.blue.shade900;
        iconData = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Icon(iconData, color: textColor, size: 24),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: TextStyle(color: textColor, fontSize: 16))),
          if (onActionPressed != null && actionLabel != null) ...[
            const SizedBox(width: 8),
            TextButton(
              onPressed: onActionPressed,
              style: TextButton.styleFrom(
                foregroundColor: textColor,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                minimumSize: const Size(0, 36),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(actionLabel!, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
            ),
          ],
          if (showCloseIcon) ...[
            const SizedBox(width: 4),
            InkWell(
              onTap: () {
                // Handle close widget if needed
              },
              borderRadius: BorderRadius.circular(50),
              child: Padding(padding: const EdgeInsets.all(4), child: Icon(Icons.close, color: textColor, size: 20)),
            ),
          ],
        ],
      ),
    );
  }
}
