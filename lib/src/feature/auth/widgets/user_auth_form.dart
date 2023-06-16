import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/widgets/custom_input_TextField.dart';
import '../controller/auth_controller.dart';

class UserAuthForm extends StatefulWidget {

  const UserAuthForm({ Key? key }): super(key: key);

  @override
  State<UserAuthForm> createState() => _UserAuthFormState();
}

class _UserAuthFormState extends BaseState<UserAuthForm, AuthController> {
   @override
   Widget build(BuildContext context) {
       return SingleChildScrollView(
         child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomInputTextfield(
                    label: "Email",
                    icon: const Icon(Icons.mail_outline_rounded),
                    onChanged: (value) {
                       controller.authDto = controller.authDto.copyWith(email: value);
                       log("email: ${controller.authDto.email}");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomInputTextfield(
                    label: "Senha",
                    icon: const Icon(Icons.lock_outline_rounded),
                    onChanged: (value) {
                       controller.authDto = controller.authDto.copyWith(password: value);
                       log("senha: ${controller.authDto.password}");
                    },
                  ),
                ),
              ],
         ),
       );
  }
}