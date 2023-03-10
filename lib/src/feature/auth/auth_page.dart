import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import 'package:mob_storage_app/src/feature/auth/auth_controller.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/custom_input_TextField.dart';

class AuthPage extends StatefulWidget {

  const AuthPage({ Key? key }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends BaseState<AuthPage> {
  late final AuthController controller;

@override
  void onReady() {
    super.onReady();
    
    controller = context.read<AuthController>();
    controller.addListener(() async {
      if (controller.state == AuthState.loading) {}
      if (controller.state == AuthState.error) {
        showError('Erro ao autenticar usuário');
      }
      if (controller.state == AuthState.success) {
        showSuccess('Usuário Logado com sucesso!');
        Navigator.of(context).popAndPushNamed('/');
      }
    });
  }
   @override
   Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 50),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 50),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login de usuário',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: CustomInputTextfield(
                        height: context.percentHeight(.07),
                        width: context.percentWidth(.9),
                        icon: const Icon(Icons.mail_outline),
                        label: "Email",
                        onChanged: (value) {
                          controller.auth =
                              controller.auth.copyWith(email: value);
                          log(controller.auth.email);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: CustomInputTextfield(
                        height: context.percentHeight(.07),
                        width: context.percentWidth(.9),
                        icon: const Icon(Icons.lock_outline),
                        obscureText: true,
                        label: "Senha",
                        onChanged: (value) {
                          controller.auth =
                              controller.auth.copyWith(password: value);
                          log(controller.auth.password);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: SizedBox(
                width: context.percentWidth(.8),
                height: context.percentHeight(.06),
                child: PrimaryButton(
                  label: "Logar",
                  onPressed: () {
                    controller.loginAction();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}