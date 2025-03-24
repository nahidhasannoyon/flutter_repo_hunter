import '../../../../core/services/networking/api_service.dart';
import '../../../../data/models/repository_model.dart';
import '../../../../data/providers/cache_provider.dart';

class HomeRepository {
  final ApiService _apiService;

  HomeRepository(this._apiService);

  /// Fetch repositories from GitHub API
  Future<List<RepositoryModel>> fetchRepositories() async {
    try {
      final response = await _apiService.getRequest(
        '/search/repositories',
        query: {
          'q': 'Flutter',
          'sort': 'stars',
          'order': 'desc',
          'per_page': '50',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> items = response.body['items'];
        final List<RepositoryModel> repositories =
            items.map((json) => RepositoryModel.fromJson(json)).toList();

        // Save to cache
        await CacheProvider.saveRepositories(repositories);
        return repositories;
      } else {
        throw Exception("Failed to fetch repositories");
      }
    } catch (e) {
      // If API call fails, load cached repositories
      return CacheProvider.loadRepositories();
    }
  }
}
