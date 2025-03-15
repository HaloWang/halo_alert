import 'package:flutter/foundation.dart';

enum AlertNotifyStatus {
  success,
  warning,
  error,
  info,
}

enum AlertDisplayStatus {
  deploy,
  show,
  hide,
}

enum AlertPosition {
  top,
  bottom,
  center,
}

@immutable
final class AlertItem {
  final int id;
  final String message;
  final AlertNotifyStatus status;
  final AlertDisplayStatus displayStatus;
  final AlertPosition position;

  const AlertItem({
    required this.id,
    required this.message,
    required this.status,
    required this.displayStatus,
    required this.position,
  });

  AlertItem copyWith({
    int? id,
    String? message,
    AlertNotifyStatus? status,
    AlertDisplayStatus? displayStatus,
    AlertPosition? position,
  }) =>
      AlertItem(
        id: id ?? this.id,
        message: message ?? this.message,
        status: status ?? this.status,
        displayStatus: displayStatus ?? this.displayStatus,
        position: position ?? this.position,
      );
}
