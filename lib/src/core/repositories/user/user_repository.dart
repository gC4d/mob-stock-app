
import 'package:mob_storage_app/src/core/models/user_model.dart';

abstract class UserRepository {
  Future<void> init();

  Future<bool> checkforUserIsLogged();

  Future<void> signUpUser(Map<String, dynamic> user);

  Future<Map<String, dynamic>> authUser(Map<String, dynamic> user);

  Future<void> signOutUser();
}