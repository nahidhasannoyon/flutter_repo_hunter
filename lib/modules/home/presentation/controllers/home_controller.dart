import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class HomeController extends GetxController {
  final RepositoryRepository _repositoryRepository;
  final NetworkHelper _networkHelper;

  HomeController(this._repositoryRepository, this._networkHelper);

  var repositories = <RepositoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var sortMethod = Rx<SortMethod?>(null);

  bool? _wasConnected; // Track last connection state

  @override
  void onInit() {
    super.onInit();
    _checkInternetAndLoadData();
    _listenToNetworkChanges();
  }

  Future<void> _checkInternetAndLoadData() async {
    isLoading(true);
    bool isConnected = await _networkHelper.checkConnection();

    if (isConnected) {
      await fetchRepositories();
    } else {
      List<RepositoryModel> cachedData = CacheProvider.loadRepositories();
      if (cachedData.isNotEmpty) {
        repositories.assignAll(cachedData);
      } else {
        _showSnackbar("No Data Available", "Please connect to the internet.");
      }
    }
    isLoading(false);
  }

  /// Fetch repositories from API and update cache
  Future<void> fetchRepositories() async {
    try {
      isLoading(true);
      final result = await _repositoryRepository.fetchRepositories();
      repositories.assignAll(result);
      errorMessage('');
    } catch (e) {
      errorMessage(e.toString());
      _showSnackbar("Error", "Failed to fetch data.");
    } finally {
      isLoading(false);
    }
  }

  void _listenToNetworkChanges() {
    _networkHelper.connectionStream.listen((isConnected) {
      if (_wasConnected != isConnected) {
        // Only trigger if state changes
        _wasConnected = isConnected;

        if (isConnected) {
          _showSnackbar("Internet Restored", "Fetching latest data...");
          fetchRepositories();
        } else {
          _showSnackbar("No Internet", "Loading data from cache...");
        }
      }
    });
  }

  /// Show a snackbar message
  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
  }

  /// Sort repositories by stars
  void sortByStars() {
    repositories.sort((a, b) => b.stars!.compareTo(a.stars!));
    sortMethod.value = SortMethod.stars;
  }

  /// Sort repositories by last updated date
  void sortByUpdatedDate() {
    repositories.sort(
      (a, b) => (b.updatedAt.millisecondsSinceEpoch).compareTo(
        a.updatedAt.millisecondsSinceEpoch,
      ),
    );
    sortMethod.value = SortMethod.updated;
  }
}
