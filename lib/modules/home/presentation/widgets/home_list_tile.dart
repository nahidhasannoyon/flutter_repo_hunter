import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/image_util.dart';
import '../../../../data/models/repository_model.dart';
import '../views/repo_details_view.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({super.key, required this.repo});

  final RepositoryModel repo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => RepoDetailsView(repository: repo));
      },
      leading: OwnerAvatar(avatarUrl: repo.owner?.avatarUrl ?? ''),
      title: Text(repo.name!),
      subtitle: Text(
        repo.description!.isNotEmpty
            ? repo.description!.length > 100
                ? '${repo.description!.substring(0, 100)}...'
                : repo.description!
            : 'No description',
      ),
      trailing: Text('${repo.stars} ⭐'),
    );
  }
}
