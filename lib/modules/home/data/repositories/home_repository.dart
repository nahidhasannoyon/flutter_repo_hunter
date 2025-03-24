import '../../../../data/models/repository_model.dart';
import '../../../../data/repositories/repository_repository.dart';

class HomeRepository {
  final RepositoryRepository _repositoryRepository;

  HomeRepository(this._repositoryRepository);

  Future<List<RepositoryModel>> getRepositories() async {
    return await _repositoryRepository.fetchRepositories();
  }
}
