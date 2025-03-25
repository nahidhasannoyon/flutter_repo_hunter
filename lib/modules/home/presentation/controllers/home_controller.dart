import 'package:flutter_repo_hunter/domain/enums/sort_method.dart';
import 'package:get/get.dart';
import '../../../../data/models/repository_model.dart';
import '../../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  var repositories = <RepositoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var sortMethod = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRepositories();
  }

  /// Fetch repositories from HomeRepository
  Future<void> fetchRepositories() async {
    try {
      isLoading(true);
      final result = await _homeRepository.getRepositories();
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
    repositories.sort((a, b) => b.stars!.compareTo(a.stars!));
    sortMethod.value = SortMethod.stars.toString();
  }

  /// Sort repositories by last updated date
  void sortByUpdatedDate() {
    repositories.sort(
      (a, b) => (b.updatedAt.millisecondsSinceEpoch).compareTo(
        a.updatedAt.millisecondsSinceEpoch,
      ),
    );
    sortMethod.value = SortMethod.updated.toString();
  }
}
