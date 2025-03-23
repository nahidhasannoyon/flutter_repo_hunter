import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/models/repository_model.dart';
import '../../../../data/repositories/github_repository.dart';

class GitHubController extends GetxController {
  final GitHubRepository _repository = GitHubRepository();

  var repositories = <RepositoryModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

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
    } catch (e) {
      log(e.toString());
      errorMessage("Failed to fetch data. Try again later.");
    } finally {
      isLoading(false);
    }
  }
}
