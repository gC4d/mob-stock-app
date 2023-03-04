
import '../register_user_dto.dart';

abstract class RegisterRepository {
  Future<void> registerAction();
}