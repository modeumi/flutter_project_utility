import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:utility/alert_message.dart';

ToastificationItem TopToast(BuildContext context, String type, String content) {
  Color baseColor;
  Color backgroundColor;
  Color foregroundColor;
  IconData icon;

  switch (type) {
    case 'success':
      baseColor = const Color(0xFF4CAF50);
      backgroundColor = const Color(0xFFE8F5E9);
      foregroundColor = const Color(0xFF2E7D32);
      icon = Icons.check_circle;
      break;
    case 'warning':
      baseColor = const Color(0xFFFFC107);
      backgroundColor = const Color(0xFFFFF8E1);
      foregroundColor = const Color(0xFFF57F17);
      icon = Icons.warning_rounded;
      break;
    case 'fail':
      baseColor = const Color(0xFFF44336);
      backgroundColor = const Color(0xFFFFEBEE);
      foregroundColor = const Color(0xFFC62828);
      icon = Icons.error;
      break;
    default:
      baseColor = const Color(0xFF4CAF50);
      backgroundColor = const Color(0xFFE8F5E9);
      foregroundColor = const Color(0xFF2E7D32);
      icon = Icons.check_circle;
  }

  return toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 4),
    showProgressBar: true,
    progressBarTheme: ProgressIndicatorThemeData(
      color: baseColor,
      linearTrackColor: baseColor.withValues(alpha: 0.2),
    ),
    closeOnClick: false,
    pauseOnHover: true,
    callbacks: ToastificationCallbacks(
      onTap: (item) {
        toastification.dismiss(item);
        alertMessage(content, type);
      },
    ),
    closeButton: const ToastCloseButton(),
    icon: Icon(icon, color: foregroundColor, size: 24),
    title: Text(
      content,
      style: TextStyle(
        color: foregroundColor,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    primaryColor: baseColor,
    borderSide: BorderSide(color: baseColor.withValues(alpha: 0.3)),
    borderRadius: BorderRadius.circular(12),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );
}
