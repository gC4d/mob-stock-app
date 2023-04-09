import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/dto/add_stock_dto.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_drawer.dart';
import 'package:mob_storage_app/src/feature/home/home_controller.dart';
import 'package:mob_storage_app/src/feature/home/home_state.dart';
import 'package:bloc/bloc.dart';
import '../../core/ui/base_state/base_state.dart';
import './widgets/custom_home_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() async {
    super.onReady();
    await controller.checkUser();
    controller.getStocks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            notLogged: () => Navigator.of(context).popAndPushNamed('/splash'),
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
          appBar: AppBar(
            title: const Text(
              'MobStock',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    controller.logoutUser();
                  },
                  icon: const Icon(Icons.logout_outlined))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: state.stocks.length,
              itemBuilder: (context, index) {
                final stocks = state.stocks[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomHomeButton(
                    height: context.percentHeight(.15),
                    width: context.screenWidth,
                    description: stocks.description,
                    category: stocks.category,
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: const Text("Novo estoque"),
              onPressed: () => Navigator.of(context).pushNamed("/add/stock")),
        );
      },
    );
  }
}
