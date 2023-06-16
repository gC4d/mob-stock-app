import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if(index == 0) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed("/");
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.storage_rounded),
          label: Text('Estoques'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.shopping_cart_outlined),
          label: Text('Produtos'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
        SizedBox(height: context.percentHeight(.57),),
      ],
    );
  }
}
