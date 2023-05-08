
abstract class Synchronizer {
  Future<void> SynchronizeData();
  Future<void> SynchronizeStocks();
  Future<void> SynchronizeProducts();
  Future<int> checkForNetworkConnection();
}