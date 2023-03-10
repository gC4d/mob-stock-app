import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/messages.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_input_TextField.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import 'package:mob_storage_app/src/feature/register/register_controller.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import '../../core/ui/base_state/base_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage> {
  late final RegisterController controller;

  @override
  void onReady() {
    super.onReady();

    controller = context.read<RegisterController>();
    controller.addListener(() async {
      if (controller.state == RegisterState.loading) {}
      if (controller.state == RegisterState.error) {
        showError('Erro ao cadastrar usuário');
      }
      if (controller.state == RegisterState.success) {
        showSuccess('Usuário cadastrado com sucesso!');
        Navigator.of(context).popAndPushNamed('/auth');
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
                      'Cadastro de usuário',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: CustomInputTextfield(
                        height: context.percentHeight(.07),
                        width: context.percentWidth(.9),
                        icon: const Icon(Icons.person),
                        label: "Nome",
                        onChanged: (value) {
                          controller.user =
                              controller.user.copyWith(name: value);
                          log(controller.user.name);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: CustomInputTextfield(
                        height: context.percentHeight(.07),
                        width: context.percentWidth(.9),
                        icon: const Icon(Icons.mail_outline),
                        label: "Email",
                        onChanged: (value) {
                          controller.user =
                              controller.user.copyWith(email: value);
                          log(controller.user.email);
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
                          controller.user =
                              controller.user.copyWith(password: value);
                          log(controller.user.password);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: CustomInputTextfield(
                        height: context.percentHeight(.07),
                        width: context.percentWidth(.9),
                        icon: const Icon(Icons.lock_outline),
                        label: "Confirmar senha",
                        onChanged: (value) {
                          controller.confirmPassword = value;
                          log(controller.confirmPassword);
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
                  label: "Cadastrar",
                  onPressed: () {
                    controller.registerAction();
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
