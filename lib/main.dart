import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:flutter_presentations/shared/animation_mode.dart';
import 'package:flutter_presentations/shared/material_import.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    const AnimationMode(
      enabled: true,
      child: const FlutterPresentations(),
    ),
  );
}
