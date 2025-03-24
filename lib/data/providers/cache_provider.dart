import 'dart:convert';
import 'package:flutter_repo_hunter/core/constants/app_strings.dart';
import 'package:get_storage/get_storage.dart';
import '../models/repository_model.dart';

class CacheProvider {
  static final GetStorage _storage = GetStorage();

  /// Save repositories to local storage
  static Future<void> saveRepositories(
    List<RepositoryModel> repositories,
  ) async {
    final String jsonString = jsonEncode(
      repositories.map((repo) => repo.toJson()).toList(),
    );
    await _storage.write(AppStrings.cacheKey, jsonString);
  }

  /// Load repositories from local storage
  static List<RepositoryModel> loadRepositories() {
    final String? jsonString = _storage.read(AppStrings.cacheKey);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => RepositoryModel.fromJson(json)).toList();
  }
}
