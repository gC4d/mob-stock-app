import 'dart:io';
import 'dart:ui';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:path_provider_ios/path_provider_ios.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/core/configuration/env/env.dart';
import 'src/core/services/hive/hive_config.dart';

Future<void> main() async {
  await Env.i.load();
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) PathProviderAndroid.registerWith();
  if (Platform.isIOS) PathProviderIOS.registerWith();
  await HiveConfig.start();
  runApp(
    const App(),
  );
}
