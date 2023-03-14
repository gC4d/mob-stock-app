
import 'package:mob_storage_app/src/core/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> checkforUserIsLogged();
}