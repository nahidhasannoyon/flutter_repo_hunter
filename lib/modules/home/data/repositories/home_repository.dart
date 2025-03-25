import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class HomeRepository {
  final RepositoryRepository _repositoryRepository;

  HomeRepository(this._repositoryRepository);

  Future<List<RepositoryModel>> getRepositories() async {
    return await _repositoryRepository.fetchRepositories();
  }
}
