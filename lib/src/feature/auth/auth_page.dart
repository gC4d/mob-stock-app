import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import 'package:mob_storage_app/src/feature/auth/auth_controller.dart';

class AuthPage extends StatefulWidget {

  const AuthPage({ Key? key }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthController controller = AuthController();

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                  controller.authdto = controller.authdto.copyWith(email: value);
                  log("${controller.authdto.email}");
                  },
                  decoration: InputDecoration(
                    hintText: "email"
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    controller.authdto = controller.authdto.copyWith(password: value);
                    log("${controller.authdto.password}");
                  },
                  decoration: InputDecoration(
                    hintText: "senha"
                  ),
                ),
                PrimaryButton(label: 'enviar', onPressed: () {
                  controller.loginAction();
                })
              ],
             ),
           ),
       );
  }
}