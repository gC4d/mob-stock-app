abstract class RoutesRepository {
  Future<Map<String, dynamic>> goTo();
  Future<void> back();
  Future<Map<String, dynamic>> backTo();
}
