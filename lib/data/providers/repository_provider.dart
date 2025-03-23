import '../../core/services/networking/api_service.dart';
import '../models/repository_model.dart';
import '../../core/constants/api_endpoints.dart';
import 'package:get/get.dart';

class RepositoryProvider {
  final ApiService apiService = Get.find<ApiService>();

  Future<List<RepositoryModel>> fetchRepositories() async {
    final response = await apiService.getRequest(
      ApiEndpoints.searchRepositories,
    );

    if (response.statusCode == 200) {
      final data = response.body;
      return (data['items'] as List)
          .map((item) => RepositoryModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed to fetch repositories: ${response.statusCode}");
    }
  }
}
