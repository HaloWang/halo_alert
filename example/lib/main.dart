import 'package:flutter/material.dart';
import 'package:halo/halo.dart';
import 'package:halo_alert/halo_alert.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainApp(),
      builder: (context, child) {
        return Stack(children: [
          child!,
          Alert.deploy(),
        ]);
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void _showWarning() {
    final message = HF.randomBool() ? 'Warning' : HF.randomString(max: 600);
    final position = AlertPosition.values.random!;
    Alert.warning(message, position: position);
  }

  void _showError() {
    final message = HF.randomBool() ? 'Error' : HF.randomString(max: 600);
    final position = AlertPosition.values.random!;
    Alert.error(message, position: position);
  }

  void _showSuccess() {
    final message = HF.randomBool() ? 'Success' : HF.randomString(max: 600);
    final position = AlertPosition.values.random!;
    Alert.success(message, position: position);
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    return Scaffold(
      body: C(
        padding: EI.s(h: 24),
        child: Co(
          c: CAA.stretch,
          m: MAA.end,
          children: [
            ElevatedButton(
              onPressed: _showWarning,
              child: const Text('Show Warning'),
            ),
            ElevatedButton(
              onPressed: _showError,
              child: const Text('Show Error'),
            ),
            ElevatedButton(
              onPressed: _showSuccess,
              child: const Text('Show Success'),
            ),
            24.h,
            padding.bottom.h,
          ],
        ),
      ),
    );
  }
}
