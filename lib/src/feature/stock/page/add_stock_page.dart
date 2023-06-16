import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/widgets/custom_input_TextField.dart';
import '../stock_controller.dart';
import '../stock_state.dart';
import '../widgets/categories_stock_dropdown.dart';

class AddStockPage extends StatefulWidget {
  const AddStockPage({super.key});

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends BaseState<AddStockPage, StockController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockController, StockState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            success: () => Navigator.of(context).popAndPushNamed("/"),
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
                    height: context.percentHeight(.4),
                    color: Theme.of(context).colorScheme.background,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                      child: SizedBox(
                        height: context.percentHeight(.250),
                        width: context.screenWidth,
                        child: Image.asset(
                            "assets/images/add_stock_image_light_mode.png"),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: context.percentHeight(.58),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                              child: SizedBox(
                                height: context.percentHeight(.080),
                                child: const Text(
                                  "Novo estoque",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: CustomInputTextfield(
                                label: "Descrição",
                                icon: const Icon(Icons.storage_rounded),
                                onChanged: (value) {
                                  controller.stockData = controller
                                      .stockData
                                      .copyWith(description: value);
                                  log("nome: ${controller.stockData.description}");
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Container(
                                width: context.screenWidth,
                                height: context.percentHeight(.08),
                                padding: const EdgeInsets.only(top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1, color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.5)),
                                ),
                                child: const CategoriesStockDropdown(),
                              ),
                            ),
                            SizedBox(
                              height: context.percentHeight(.1),
                            ),
                            SizedBox(
                              width: context.percentWidth(.8),
                              height: context.percentHeight(.07),
                              child: PrimaryButton(
                                label: "Adicionar",
                                onPressed: () {
                                  controller.addNewStock();
                                },
                              ),
                            )
                          ],
                        ),
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
