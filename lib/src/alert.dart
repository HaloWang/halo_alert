// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:halo_alert/src/hud.dart';
import 'package:halo_alert/src/state.dart';
import 'package:halo_alert/src/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Alert extends StatelessWidget {
  static AlertPosition defaultPosition = AlertPosition.top;
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
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.success,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
    );
  }

  static Future<void> warning(
    String msg, {
    bool noDuplicate = true,
    AlertPosition? position,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.warning,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
    );
  }

  static Future<void> error(
    String msg, {
    bool noDuplicate = true,
    AlertPosition? position,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.error,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
    );
  }

  static Future<void> info(
    String msg, {
    bool noDuplicate = true,
    AlertPosition? position,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.info,
      position: position ?? defaultPosition,
      noDuplicate: noDuplicate,
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
