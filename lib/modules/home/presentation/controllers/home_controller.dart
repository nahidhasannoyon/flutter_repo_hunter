import 'package:get/get.dart';
import '../../../../core/helpers/network_helper.dart';
import '../../../../data/models/repository_model.dart';
import '../../../../data/repositories/repository_repository.dart';
import '../../../../data/providers/cache_provider.dart';
import '../../../../domain/enums/sort_method.dart';

class HomeController extends GetxController {
  final RepositoryRepository _repositoryRepository;
  final NetworkHelper _networkHelper;

  HomeController(this._repositoryRepository, this._networkHelper);

  var repositories = <RepositoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var sortMethod = Rx<SortMethod?>(null);

  @override
  void onInit() {
    super.onInit();
    _checkInternetAndLoadData();
    _listenToNetworkChanges();
  }

  /// Check internet and fetch data accordingly
  Future<void> _checkInternetAndLoadData() async {
    isLoading(true);
    bool isConnected = await _networkHelper.checkConnection();

    if (isConnected) {
      await fetchRepositories();
    } else {
      _showSnackbar("No Internet", "Loading data from cache...");
      List<RepositoryModel> cachedData = CacheProvider.loadRepositories();
      if (cachedData.isNotEmpty) {
        repositories.assignAll(cachedData);
      } else {
        _showSnackbar(
          "No Data Available in Cache",
          "Please connect to the internet.",
        );
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

  /// Listen to network changes and auto-fetch if reconnected
  void _listenToNetworkChanges() {
    _networkHelper.connectionStream.listen((isConnected) {
      if (isConnected) {
        _showSnackbar("Internet Restored", "Fetching latest data...");
        fetchRepositories();
      }
    });
  }

  /// Show a snackbar message
  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
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
