// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:halo_alert/src/hud.dart';
import 'package:halo_alert/src/state.dart';
import 'package:halo_alert/src/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Alert extends StatelessWidget {
  static AlertPosition defaultPosition = AlertPosition.top;

  static Color? Function()? defaultColor;
  static Color? Function()? defaultSuccessColor;
  static Color? Function()? defaultWarningColor;
  static Color? Function()? defaultErrorColor;
  static Color? Function()? defaultInfoColor;

  static ThemeMode? preferredThemeMode;
  static double topAdjustment = 0.0;
  static double centerAdjustment = 0.0;
  static double bottomAdjustment = 0.0;

  @Deprecated('Use `const Alert()` instead')
  static Widget deploy() {
    return UncontrolledProviderScope(
      container: AlertStates.container,
      child: const IgnorePointer(child: HUD()),
    );
  }

  static Future<void> success(
    String msg, {
    bool noDuplicate = true,
    AlertPosition? position,
    Color? color,
  }) async {
    final id = DateTime.now().microsecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.success,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
      color: color ?? defaultSuccessColor?.call() ?? defaultColor?.call(),
    );
  }

  static Future<void> warning(
    String msg, {
    bool noDuplicate = true,
    AlertPosition? position,
    Color? color,
  }) async {
    final id = DateTime.now().microsecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.warning,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
      color: color ?? defaultWarningColor?.call() ?? defaultColor?.call(),
    );
  }

  static Future<void> error(
    String msg, {
    bool noDuplicate = true,
    AlertPosition? position,
    Color? color,
  }) async {
    final id = DateTime.now().microsecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.error,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
      color: color ?? defaultErrorColor?.call() ?? defaultColor?.call(),
    );
  }

  static Future<void> info(
    String msg, {
    bool noDuplicate = true,
    AlertPosition? position,
    Color? color,
  }) async {
    final id = DateTime.now().microsecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.info,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
      color: color ?? defaultInfoColor?.call() ?? defaultColor?.call(),
    );
  }

  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: AlertStates.container,
      child: const IgnorePointer(child: HUD()),
    );
  }
}
