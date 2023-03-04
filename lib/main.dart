import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mob_storage_app/src/core/modules/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';
import 'src/core/configuration/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  SharedPreferences.setMockInitialValues({});
  runApp(
    ModularApp(
      module: AppModule(),
      child: App(),
    ),
  );
}
