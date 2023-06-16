import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_drawer.dart';
import 'package:mob_storage_app/src/feature/stock/stock_controller.dart';
import '../../core/ui/base_state/base_state.dart';
import '../home/widgets/custom_home_button.dart';
import 'stock_state.dart';


class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends BaseState<StockPage, StockController> {
  @override
  void onReady() async {
    super.onReady();
    controller.getStocks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockController, StockState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
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
          drawer: const CustomDrawer(),
          body: Stack(
            children: [
              
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ListView.builder(
                    itemCount: state.stocks.length,
                    itemBuilder: (context, index) {
                      final stocks = state.stocks[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const StockPage();
                              }),
                            );
                          },
                          child: CustomHomeButton(
                            height: context.percentHeight(.15),
                            width: context.screenWidth,
                            description: stocks.description,
                            category: stocks.category,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed("/add/stock");
              }),
        );
      },
    );
  }
}
