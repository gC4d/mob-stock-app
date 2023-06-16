import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/data/entities/stock_entity.dart';
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
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: context.screenWidth,
                    height: context.percentHeight(.5),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  Container(
                    width: context.screenWidth,
                    height: context.percentHeight(.5),
                    color: Theme.of(context).colorScheme.background,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 20,
                              )),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.percentHeight(.1),
                          ),
                          Container(
                            height: context.percentHeight(.8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 5),
                                  child: SizedBox(
                                    height: context.percentHeight(.082),
                                    child: const Text(
                                      "Cadastrar usuário",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
