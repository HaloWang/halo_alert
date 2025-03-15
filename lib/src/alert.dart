// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:halo_alert/src/hud.dart';
import 'package:halo_alert/src/state.dart';
import 'package:halo_alert/src/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Alert {
  static Widget deploy() {
    return UncontrolledProviderScope(
      container: AlertStates.container,
      child: const IgnorePointer(child: HUD()),
    );
  }

  static Future<void> success(
    String msg, {
    AlertPosition position = AlertPosition.top,
    bool noDuplicate = true,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.success,
      position: position,
      noDuplicate: noDuplicate,
    );
  }

  static Future<void> warning(
    String msg, {
    AlertPosition position = AlertPosition.top,
    bool noDuplicate = true,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.warning,
      position: position,
      noDuplicate: noDuplicate,
    );
  }

  static Future<void> error(
    String msg, {
    AlertPosition position = AlertPosition.top,
    bool noDuplicate = true,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.error,
      position: position,
      noDuplicate: noDuplicate,
    );
  }

  static Future<void> info(
    String msg, {
    AlertPosition position = AlertPosition.top,
    bool noDuplicate = true,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    return await AlertStates.show(
      id: id,
      message: msg,
      notifyStatus: AlertNotifyStatus.info,
      position: position,
      noDuplicate: noDuplicate,
    );
  }
}
