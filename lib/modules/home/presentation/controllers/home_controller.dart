import 'package:get/get.dart';
import '../../../../data/models/repository_model.dart';
import '../../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  var repositories = <RepositoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var sortMethod = ''.obs; // Added observable to track sort method

  @override
  void onInit() {
    super.onInit();
    fetchRepositories();
  }

  /// Fetch repositories from repository
  Future<void> fetchRepositories() async {
    try {
      isLoading(true);
      final result = await _homeRepository.fetchRepositories();
      repositories.assignAll(result);
      errorMessage('');
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  /// Sort repositories by stars
  void sortByStars() {
    // repositories.sort((a, b) => b.stars.compareTo(a.stars));
    repositories.sort(
      (a, b) => b.stars!.compareTo(a.stars!),
    ); // Handles null safely
    sortMethod.value = 'stars';
  }

  /// Sort repositories by last updated date
  void sortByUpdatedDate() {
    // repositories.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    repositories.sort(
      (a, b) => (b.updatedAt != null ? b.updatedAt!.millisecondsSinceEpoch : 0)
          .compareTo(
            a.updatedAt != null ? a.updatedAt!.millisecondsSinceEpoch : 0,
          ),
    ); // Handles null safely
    sortMethod.value = 'updated';
  }
}
