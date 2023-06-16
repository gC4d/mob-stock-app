abstract class UserRepository {
  Future<bool> checkforUserIsLogged();
  Future<void> signUpUser(Map<String, dynamic> signUpUser);
  Future<void> authUser(Map<String, dynamic> authUserDto);
  Future<void> signOutUser();
  Future<String> getUserName();
  Future<int> getUserid();
}
