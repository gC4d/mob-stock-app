import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/auth/auth_controller.dart';
import '../../feature/register/register_controller.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => AuthController())),
        ChangeNotifierProvider(create: ((context) => RegisterController())),
        /* ChangeNotifierProvider(create: ((context) => HomeController())),
        Provider(create: ((context) => GlobalUser())) */
      ],
      child: child,
    );
  }
}
