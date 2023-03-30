
abstract class StorageRepository {
  Future<void> createStorage(Map<String, dynamic> storage);
  Future<List<Map<String, dynamic>>> getStorage(Map<String, dynamic> user);
  Future<void> updateStorage(Map<String, dynamic> storage);
  Future<void> deleteStorage(Map<String, dynamic> storage);
}