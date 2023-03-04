import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import 'package:mob_storage_app/src/feature/register/register_controller.dart';
import 'package:mob_storage_app/src/feature/register/repository/register_repository.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import '../../core/ui/base_state/base_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage> {
  RegisterController controller = RegisterController();

  @override
  void onReady() {
    super.onReady();

    controller = context.read<RegisterController>();
    controller.addListener(() {
      if (controller.state == RegisterState.loading) {}
      if (controller.state == RegisterState.error) {}
      if (controller.state == RegisterState.success) {
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              controller.user = controller.user.copyWith(name: value);
              log("${controller.user.name}");
            },
            decoration: const InputDecoration(hintText: 'nome'),
          ),
          TextField(
            onChanged: (value) {
              controller.user = controller.user.copyWith(email: value);
              log("${controller.user.email}");
            },
            decoration: const InputDecoration(hintText: 'email'),
          ),
          TextField(
            onChanged: (value) {
              controller.user = controller.user.copyWith(password: value);
              log("${controller.user.password}");
            },
            decoration: const InputDecoration(hintText: 'senha'),
          ),
          TextField(
            onChanged: (value) {
              controller.confirmPassword = value;
              log("${controller.confirmPassword}");
            },
            decoration: const InputDecoration(hintText: 'confirmar senha'),
          ),
          PrimaryButton(
              label: "Cadastrar",
              onPressed: () {
                controller.registerAction();
                Navigator.of(context).popAndPushNamed('/auth');
              })
        ],
      ),
    );
  }
}
