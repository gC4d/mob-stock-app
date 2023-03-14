import 'package:flutter_modular/flutter_modular.dart';
import 'package:mob_storage_app/src/feature/home/home_page.dart';

class HomeRouter extends Module {

   @override
   List<Bind> get binds => [];

   @override
   List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage())
   ];

}