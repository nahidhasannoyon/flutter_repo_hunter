import '../models/repository_model.dart';
import '../providers/repository_provider.dart';

class RepositoryRepository {
  final RepositoryProvider provider;

  RepositoryRepository({required this.provider});

  Future<List<RepositoryModel>> getRepositories() async {
    return await provider.fetchRepositories();
  }
}
