import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/feature/group/group_controller.dart';
import 'package:provider/provider.dart';
import 'group_page.dart';

class GroupRouter {
  GroupRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => GroupController(context.read()))
        ],
        child: const GroupPage(),
      );
}
