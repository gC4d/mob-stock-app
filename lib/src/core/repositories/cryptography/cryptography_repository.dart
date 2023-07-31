abstract class CryptographyRepository {
  Future<String> keyGenerator(
      String description, String password, DateTime datetime, String email);
}
