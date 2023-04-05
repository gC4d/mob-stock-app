import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_drawer.dart';
import 'package:mob_storage_app/src/feature/home/home_controller.dart';
import 'package:mob_storage_app/src/feature/home/home_state.dart';
import 'package:bloc/bloc.dart';
import '../../core/ui/base_state/base_state.dart';
import 'widgets/custom_home_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    super.onReady();
    controller.checkUser();
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
              'Mobile Storage',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(onPressed: () {
                controller.logoutUser();
              }, icon: const Icon(Icons.logout_outlined))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomHomeButton(
                    width: context.percentWidth(.9),
                    height: context.percentHeight(.2),
                    label: "Estoque 1",
                    icon: Icons.storage_rounded,
                    function: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomHomeButton(
                    width: context.percentWidth(.9),
                    height: context.percentHeight(.2),
                    label: "Estoque 2",
                    icon: Icons.storage_rounded,
                    function: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomHomeButton(
                    width: context.percentWidth(.9),
                    height: context.percentHeight(.1),
                    label: "Produtos",
                    icon: Icons.shopping_cart_outlined,
                    function: () {},
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed("/add/stock");
            },
          ),
        );
      },
    );
  }
}
