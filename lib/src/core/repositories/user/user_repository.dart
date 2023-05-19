import 'package:mob_storage_app/src/core/models/user_model.dart';

abstract class UserRepository {
  Future<void> init();
  Future<bool> checkforUserIsLogged();
  Future<void> signUpUser(Map<String, dynamic> signUpUser);
  Future<void> authUser(Map<String, dynamic> authUserDto);
  Future<void> signOutUser();
  Future<String> getUserName();
  Future<int> getUserid();
}
