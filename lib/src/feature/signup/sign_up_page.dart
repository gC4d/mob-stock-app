import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_input_TextField.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import 'package:mob_storage_app/src/feature/signup/sign_up_controller.dart';
import 'package:mob_storage_app/src/feature/signup/sign_up_state.dart';

import '../../core/ui/base_state/base_state.dart';
import 'widgets/user_sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BaseState<SignUpPage, SignUpController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpController, SignUpState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? "Erro não informado");
            });
      },
      buildWhen: (previous, current) {
        return current.status.matchAny(
          any: () => false,
          initial: () => false,
          success: () => true,
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cadastro de usuário'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Container(
                    height: context.percentHeight(.5),
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20)),
                    child: const UserSignUpForm(),
                  ),
                  SizedBox(
                    height: context.percentHeight(.08),
                  ),
                  SizedBox(
                    width: context.percentWidth(.9),
                    height: context.percentHeight(.07),
                    child: PrimaryButton(
                      label: "Cadastrar",
                      onPressed: () {
                        controller.createUser();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
