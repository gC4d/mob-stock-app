import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_input_TextField.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import '../controller/sign_up_state.dart';
import '../../../core/ui/base_state/base_state.dart';
import '../controller/sign_up_controller.dart';
import '../widgets/user_sign_up_form.dart';

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
            success: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/auth");
            },
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
          appBar: AppBar(),
          body: Stack(
            children: [
              Container(
                width: context.screenWidth,
                height: context.screenheight,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.percentHeight(.1),
                  ),
                  Container(
                    height: context.percentHeight(.788),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: SizedBox(
                            height: context.percentHeight(.082),
                            child: const Text(
                              "Cadastrar usuário",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const UserSignUpForm(),
                        SizedBox(
                          height: context.percentHeight(.1),
                        ),
                        SizedBox(
                          width: context.percentWidth(.8),
                          height: context.percentHeight(.07),
                          child: PrimaryButton(
                            label: "Adicionar",
                            onPressed: () {
                              controller.createUser();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}