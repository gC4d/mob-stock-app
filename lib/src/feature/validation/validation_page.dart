import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mob_storage_app/src/core/ui/helpers/text_styles_helper.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes.dart';
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
  @override
  void onReady() async {
    super.onReady();
    await controller.userValidation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidationController, ValidationState>(
      listener: (context, state) => state.status.matchAny(
          any: () {},
      ),
      buildWhen: (previous, current) => current.status.matchAny(
        any: () => false,
        initial: () => false,
      ),
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: LottieBuilder.asset(
                    'assets/images/99797-data-management.json'),
              ),
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
