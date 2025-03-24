import 'package:get/get.dart';

import '../../../../data/models/repository_model.dart';
import '../../../../data/repositories/github_repository.dart';

enum SortType { stars, updated }

class GitHubController extends GetxController {
  final GitHubRepository _repository = GitHubRepository();

  var repositories = <RepositoryModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var sortType = SortType.stars.obs;

  @override
  void onInit() {
    fetchRepositories();
    super.onInit();
  }

  Future<void> fetchRepositories() async {
    try {
      isLoading(true);
      errorMessage('');
      repositories.value = await _repository.fetchTrendingRepositories();
      sortRepositories(); // Sort initially
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void sortRepositories() {
    if (sortType.value == SortType.stars) {
      repositories.sort(
        (a, b) =>
            (b.private == true ? 1 : 0).compareTo(a.private == true ? 1 : 0),
      ); // Handles null safely
    } else {
      repositories.sort(
        (a, b) =>
            (b.updatedAt != null ? b.updatedAt!.millisecondsSinceEpoch : 0)
                .compareTo(
                  a.updatedAt != null ? a.updatedAt!.millisecondsSinceEpoch : 0,
                ),
      ); // Handles null safely
    }
  }

  void toggleSort() {
    sortType.value =
        sortType.value == SortType.stars ? SortType.updated : SortType.stars;
    sortRepositories();
  }
}
