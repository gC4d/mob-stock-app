import 'package:mob_storage_app/src/core/models/user_model.dart';

import './user_repository.dart';


/* UTILIZAR HIVE PARA ARMAZENAR OS DADOS DE USUÁRIO */

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel> checkforUserIsLogged() {
    
    throw UnimplementedError();
  }

}