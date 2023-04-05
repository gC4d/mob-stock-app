
import '../../models/storage_model.dart';

abstract class StorageRepository {
  Future<void> createStorage(Map<String, dynamic> storage);
  Future<List<StorageModel>> findAllStorages(int userId);
  Future<void> updateStorage(Map<String, dynamic> storage);
  Future<void> deleteStorage(Map<String, dynamic> storage);
}