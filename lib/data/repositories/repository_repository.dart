import 'package:get/get.dart';
import '../models/repository_model.dart';
import '../providers/cache_provider.dart';
import '../../core/services/networking/api_service.dart';
import '../../core/constants/api_endpoints.dart';

class RepositoryRepository {
  final ApiService _apiService = Get.find<ApiService>();

  /// Fetch repositories (from cache or API)
  Future<List<RepositoryModel>> fetchRepositories() async {
    try {
      // Load cached repositories first
      List<RepositoryModel> cachedRepositories =
          CacheProvider.loadRepositories();
      if (cachedRepositories.isNotEmpty) {
        return cachedRepositories;
      }

      // Fetch from API if no cache is available
      final response = await _apiService.getRequest(
        ApiEndpoints.searchRepositories,
        query: {
          "q": "Flutter",
          "sort": "stars",
          "order": "desc",
          "per_page": "50",
        },
      );

      if (response.status.hasError) {
        throw Exception("Failed to fetch repositories");
      }

      final List<dynamic> jsonList = response.body["items"];
      final List<RepositoryModel> repositories =
          jsonList.map((json) => RepositoryModel.fromJson(json)).toList();

      // Save data to cache
      await CacheProvider.saveRepositories(repositories);

      return repositories;
    } catch (e) {
      throw Exception("Error fetching repositories: $e");
    }
  }
}
