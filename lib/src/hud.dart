// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:halo_alert/src/state.dart';
import 'package:halo_alert/src/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halo/halo.dart';

class HUD extends ConsumerWidget {
  const HUD({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(AlertStates.items);

    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final paddingTop = MediaQuery.paddingOf(context).top;
    final paddingBottom = MediaQuery.paddingOf(context).bottom;
    final light = MediaQuery.platformBrightnessOf(context) == Brightness.light;

    return Material(
      color: kC,
      child: Stack(
        children: items.indexMap((index, value) {
          final item = items[index];
          final message = item.message;
          final notifyStatus = item.status;
          Color color;
          IconData iconData;

          switch (notifyStatus) {
            case AlertNotifyStatus.warning:
              color = Colors.yellow[800]!;
              iconData = Icons.info_outline_rounded;
              break;
            case AlertNotifyStatus.error:
              color = kCR;
              iconData = Icons.error_outline;
              break;
            case AlertNotifyStatus.success:
              color = kCG;
              iconData = Icons.check_circle_outline_rounded;
              break;
            case AlertNotifyStatus.info:
              color = kCB;
              iconData = Icons.info_outline_rounded;
              break;
          }

          final alignment = switch (item.position) {
            AlertPosition.top => Alignment.topCenter,
            AlertPosition.bottom => Alignment.bottomCenter,
            AlertPosition.center => Alignment.center,
          };

          final double? top = switch (item.position) {
            AlertPosition.top => item.displayStatus == AlertDisplayStatus.show ? paddingTop + 12 : paddingTop + -50,
            AlertPosition.bottom => null,
            AlertPosition.center => item.displayStatus == AlertDisplayStatus.show ? -10 : 10,
          };

          final double? bottom = switch (item.position) {
            AlertPosition.top => null,
            AlertPosition.bottom => item.displayStatus == AlertDisplayStatus.show ? paddingBottom + 34 : paddingBottom + -50,
            AlertPosition.center => null,
          };

          final key = Key("Alert" + item.id.toString());
          final duration = item.displayStatus == AlertDisplayStatus.show ? 250.ms : 150.ms;

          return AP(
            key: key,
            duration: duration,
            curve: item.displayStatus == AlertDisplayStatus.show ? Curves.easeOutBack : Curves.easeInBack,
            top: top,
            bottom: bottom,
            height: screenHeight,
            width: screenWidth,
            child: AO(
              duration: duration,
              curve: item.displayStatus == AlertDisplayStatus.show ? Curves.easeOutBack : Curves.easeInBack,
              opacity: item.displayStatus == AlertDisplayStatus.show ? 1 : 0,
              child: C(
                decoration: const BD(color: kC),
                child: Stack(
                  children: [
                    Positioned(
                      child: Align(
                        alignment: alignment,
                        child: C(
                          padding: EI.a(12),
                          decoration: BD(
                            color: light ? kW : kB,
                            borderRadius: _kBorderRadius.r,
                            border: Border.all(
                              color: color.wo(0.33),
                              width: light ? _kLightBorderWidth : _kDarkBorderWidth,
                            ),
                            boxShadow: [
                              if (light)
                                BoxShadow(
                                  color: kB.wo(0.4),
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                ),
                            ],
                          ),
                          child: Ro(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(iconData, color: color),
                              _kIconHorizontalDistance.w,
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: screenWidth * 0.85 - 16 - _kIconHorizontalDistance - (light ? _kLightBorderWidth : _kDarkBorderWidth) * 2,
                                ),
                                child: T(
                                  message.toString(),
                                  s: TS(c: color, w: FW.w600),
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

const _kIconHorizontalDistance = 8.0;
const _kBorderRadius = 10.0;
const _kDarkBorderWidth = 1.0;
const _kLightBorderWidth = 0.0;
