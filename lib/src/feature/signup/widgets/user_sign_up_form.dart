import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/feature/signup/sign_up_controller.dart';

import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/widgets/custom_input_TextField.dart';

class UserSignUpForm extends StatefulWidget {

  const UserSignUpForm({ Key? key }): super(key: key);

  @override
  State<UserSignUpForm> createState() => _UserSignUpFormState();
}

class _UserSignUpFormState extends BaseState<UserSignUpForm, SignUpController> {
   @override
   Widget build(BuildContext context) {
       return SingleChildScrollView(
         child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomInputTextfield(
                    label: "Nome",
                    icon: const Icon(Icons.person_2_outlined),
                    onChanged: (value) {
                      controller.user = controller.user.copyWith(name: value);
                      log("nome: ${controller.user.name}");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomInputTextfield(
                    label: "Email",
                    icon: const Icon(Icons.mail_outline_rounded),
                    onChanged: (value) {
                       controller.user = controller.user.copyWith(email: value);
                       log("email: ${controller.user.email}");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomInputTextfield(
                    label: "Senha",
                    icon: const Icon(Icons.lock_outline_rounded),
                    onChanged: (value) {
                       controller.user = controller.user.copyWith(password: value);
                       log("senha: ${controller.user.password}");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomInputTextfield(
                    label: "Confirmar senha",
                    icon: const Icon(Icons.lock_outline_rounded),
                    onChanged: (value) {
                      controller.confirmPassword = value;
                      log("confirmar senha: ${controller.confirmPassword}");
                    },
                  ),
                ),
              ],
         ),
       );
  }
}