import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/feature/auth/auth_controller.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/primary_button.dart';
import 'widgets/user_auth_form.dart';

class AuthPage extends StatefulWidget {

  const AuthPage({ Key? key }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends BaseState<AuthPage, AuthController> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Login de usuário'),),
           body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Container(
                    height: context.percentHeight(.4),
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 40),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: UserAuthForm()),
                  ),
                  SizedBox(
                    height: context.percentHeight(.08),
                  ),
                  SizedBox(
                    width: context.percentWidth(.9),
                    height: context.percentHeight(.07),
                    child: PrimaryButton(
                      label: "Logar",
                      onPressed: () {
                        controller.loginAction();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
       );
  }
}