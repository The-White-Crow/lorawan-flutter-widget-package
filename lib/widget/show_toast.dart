import 'package:flutter/material.dart';
import 'package:flutter_core_package/flutter_core_package.dart';
import 'package:toastification/toastification.dart';

enum ToastType { success, error, warning, unknown }

void showToast(
  BuildContext context, {
  required ToastType type,
  required String description,
  String? title,
  Color? backgroundColor,
  Color? foregroundColor,
}) {
  const style = ToastificationStyle.flatColored;

  final toastType = switch (type) {
    ToastType.success => ToastificationType.success,
    ToastType.warning => ToastificationType.warning,
    ToastType.error => ToastificationType.error,
    _ => ToastificationType.warning,
  };

  final backgroundColor = switch (type) {
    ToastType.success => context.successScheme.colorContainer,
    ToastType.warning => context.warningScheme.colorContainer,
    ToastType.error => context.colorScheme.errorContainer,
    _ => context.infoScheme.colorContainer,
  };

  final foregroundColor = switch (type) {
    ToastType.success => context.successScheme.color,
    ToastType.warning => context.warningScheme.color,
    ToastType.error => context.colorScheme.error,
    _ => context.infoScheme.color,
  };

  final primaryColor = switch (type) {
    ToastType.success => context.successScheme.color,
    ToastType.warning => context.warningScheme.color,
    ToastType.error => context.colorScheme.error,
    _ => context.infoScheme.color,
  };

  toastification.show(
    context: context,
    style: style,
    type: toastType,
    alignment: Alignment.topCenter,
    title: Text(
      description,
      maxLines: 3,
    ),
    autoCloseDuration: const Duration(seconds: 4),
    boxShadow: lowModeShadow,
    direction: TextDirection.rtl,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    primaryColor: primaryColor,
    showProgressBar: false,
  );
}
