import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'src/app.dart';
import 'src/core/configuration/env/env.dart';
import 'src/core/module/app_module.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
