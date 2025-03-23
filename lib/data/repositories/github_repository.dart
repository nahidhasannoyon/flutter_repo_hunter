import 'package:get/get.dart';
import '../../core/services/networking/api_service.dart';
import '../models/repository_model.dart';

class GitHubRepository {
  final ApiService _apiService =
      Get.find<ApiService>(); // Use GetX dependency injection

  Future<List<RepositoryModel>> fetchTrendingRepositories() async {
    try {
      final Response response = await _apiService.getRequest(
        'search/repositories',
        query: {
          'q': 'Flutter',
          'sort': 'stars',
          'order': 'desc',
          'per_page': '50',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> items = response.body['items'] ?? [];
        return items.map((json) => RepositoryModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load repositories");
      }
    } catch (e) {
      rethrow;
    }
  }
}
