import 'dart:math';

import 'package:collection/collection.dart';
import 'package:halo/halo.dart';
import 'package:halo_alert/src/types.dart';
import 'package:riverpod/riverpod.dart';

class AlertStates {
  static final deployed = StateProvider<bool>((ref) => false);
  static final items = StateProvider<List<AlertItem>>((ref) => []);
  static final container = ProviderContainer();

  static FV show({
    required int id,
    required String message,
    required AlertNotifyStatus notifyStatus,
    AlertPosition position = AlertPosition.top,
    bool noDuplicate = true,
  }) async {
    //  添加
    final c = AlertStates.container.read(AlertStates.items);

    if (noDuplicate) {
      final containMessage = c.firstWhereOrNull((e) => e.message == message) != null;
      if (containMessage) return;
    }

    final nC1 = [
      ...c,
      AlertItem(
        id: id,
        message: message,
        status: notifyStatus,
        displayStatus: AlertDisplayStatus.deploy,
        position: position,
      )
    ];
    AlertStates.container.read(AlertStates.items.notifier).state = nC1;

    //  展示
    await HF.wait(10);
    final c1 = AlertStates.container.read(AlertStates.items);
    final idx1 = c1.indexWhere((e) => e.id == id);
    c1[idx1] = AlertItem(
      id: id,
      message: message,
      status: notifyStatus,
      displayStatus: AlertDisplayStatus.show,
      position: position,
    );
    final nC2 = [...c1];
    nC2.sort((l, r) => l.id - r.id);
    AlertStates.container.read(AlertStates.items.notifier).state = nC2;

    //  收起
    await HF.wait(1900 + min(4000, message.length * 20).toInt());
    final c2 = AlertStates.container.read(AlertStates.items);
    final idx2 = c2.indexWhere((e) => e.id == id);
    c2[idx2] = AlertItem(
      id: id,
      message: message,
      status: notifyStatus,
      displayStatus: AlertDisplayStatus.hide,
      position: position,
    );
    final nC3 = [...c2];
    nC3.sort((l, r) => l.id - r.id);
    AlertStates.container.read(AlertStates.items.notifier).state = nC3;

    //  回收内存
    await HF.wait(250);
    final c3 = AlertStates.container.read(AlertStates.items);
    final idx3 = c3.indexWhere((e) => e.id == id);
    c3.removeAt(idx3);
    final nC4 = [...c3];
    nC4.sort((l, r) => l.id - r.id);
    AlertStates.container.read(AlertStates.items.notifier).state = nC4;
  }
}
