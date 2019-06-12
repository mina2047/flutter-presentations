import 'package:flutter_presentations/main.dart' as app;
import 'package:flutter_presentations/shared/material_import.dart' as ui;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}
