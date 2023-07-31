import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes_controller.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_input_TextField.dart';
import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/routes/routes.dart';
import '../../core/ui/widgets/primary_button.dart';
import 'group_controller.dart';
import 'group_state.dart';

class AddGroupPage extends StatefulWidget {
  const AddGroupPage({super.key});

  @override
  State<AddGroupPage> createState() => _AddGroupPageState();
}

class _AddGroupPageState extends BaseState<AddGroupPage, GroupController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupController, GroupState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              success: () => context.goTo(Routes.GROUP),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? "Erro não informado");
              });
        },
        buildWhen: (previous, current) => current.status.matchAny(
              any: () => false,
              initial: () => false,
              success: () => true,
            ),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Adicionar grupo'),
            ),
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
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomInputTextfield(
                              label: 'Descrição',
                              onChanged: (value) {
                                controller.groupDTO = controller.groupDTO.copywith(description: value);
                                log(controller.groupDTO.description);
                              },
                            ),
                            CustomInputTextfield(
                              label: 'Senha',
                              onChanged: (value) {
                                controller.groupDTO = controller.groupDTO.copywith(password: value);
                                log(controller.groupDTO.password);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.percentHeight(.08),
                    ),
                    SizedBox(
                      width: context.percentWidth(.9),
                      height: context.percentHeight(.07),
                      child: PrimaryButton(
                        label: "Adicionar",
                        onPressed: () {
                          controller.createGroups();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
