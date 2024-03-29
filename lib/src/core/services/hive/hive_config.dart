import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


class HiveConfig {
  static start() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}';
    await Hive.initFlutter(path);
  }
}