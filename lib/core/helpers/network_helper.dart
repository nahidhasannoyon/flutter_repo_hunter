import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class NetworkHelper {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  NetworkHelper() {
    // Check initial connection and listen for changes
    checkConnection().then((status) => _connectionController.add(status));
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      _updateConnectionStatus(results);
    });
  }

  Stream<bool> get connectionStream => _connectionController.stream;

  Future<bool> checkConnection() async {
    List<ConnectivityResult> connectivityResults =
        await _connectivity.checkConnectivity();
    return _getStatus(connectivityResults);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    _connectionController.add(_getStatus(results));
  }

  bool _getStatus(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.mobile);
  }

  void dispose() {
    _connectionController.close();
  }
}
