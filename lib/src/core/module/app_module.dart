import 'package:flutter_modular/flutter_modular.dart';

import '../../feature/home/home_router.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/home', module: HomeRouter())
  ];
  
}