import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/primary_button.dart';
import 'package:mob_storage_app/src/core/ui/widgets/secundary_button.dart';
import 'package:mob_storage_app/src/core/ui/widgets/title_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Theme.of(context).colorScheme.secondary,
              child: Text('Logo'),
            ),
            SizedBox(
              height: context.percentHeight(.2),
            ),
            const TitleWidget(label: "Bem vindo ao"),
            const TitleWidget(label: "MobileStorage"),
            SizedBox(
              height: context.percentHeight(.03),
            ),
            PrimaryButton(
              label: "Login",
              width: context.percentWidth(.7),
              onPressed: () {
                Navigator.of(context).pushNamed('/auth');
              },
            ),
            SecundaryButton(
              elevation: 0,
              width: context.percentWidth(.7),
              label: "Cadastrar",
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
            )
          ],
        ),
      ),
    );
  }
}
