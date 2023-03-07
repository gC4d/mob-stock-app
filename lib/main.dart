import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';
import 'src/core/configuration/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  SharedPreferences.setMockInitialValues({});
  runApp(const App());
}
