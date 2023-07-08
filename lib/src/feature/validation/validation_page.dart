//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/text_styles_helper.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes_controller.dart';
import 'package:mob_storage_app/src/feature/validation/validation_controller.dart';
import 'package:mob_storage_app/src/feature/validation/validation_state.dart';
import '../../core/ui/base_state/base_state.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState
    extends BaseState<ValidationPage, ValidationController> {
  void _routesValidation(BuildContext context, ValidationState state) {
    if (state.isLogged && state.hasGroups && state.groupSelected) {
      context.goTo(Routes.HOME);
    } else if (state.isLogged && !state.groupSelected) {
      context.goTo(Routes.GROUP);
    } else {
      context.goTo(Routes.SPLASH);
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await controller.synchronizer();
    await controller.appValidations();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidationController, ValidationState>(
      listener: (context, state) => state.status.matchAny(
          any: () {},
          sucess: () {
            _routesValidation(context, state);
          }),
      buildWhen: (previous, current) => current.status.matchAny(
        any: () => false,
        initial: () => false,
      ),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Buscando dados",
                style: TextStyles.i.textSemiBold.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 30,
                ),
              )),
              Center(
                  child: Text(
                "Aguarde um momento",
                style: TextStyles.i.textLight.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 15,
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
