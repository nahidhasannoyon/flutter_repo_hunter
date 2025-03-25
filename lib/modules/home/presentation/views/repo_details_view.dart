import 'package:flutter/material.dart';
import 'package:flutter_repo_hunter/core/constants/app_colors.dart';
import 'package:flutter_repo_hunter/core/utils/dimensions.dart';

import '../../../../core/utils/image_util.dart';
import '../../../../data/models/repository_model.dart';

class RepoDetailsView extends StatelessWidget {
  final RepositoryModel repository;

  const RepoDetailsView({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repository.fullName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with owner avatar and repository full name
            Row(
              children: [
                CircleAvatar(
                  radius: Dimensions.radiusImage,
                  child: OwnerAvatar(
                    avatarUrl: repository.owner.avatarUrl ?? '',
                  ),
                ),
                Dimensions.sizedBoxDefaultWidth,
                Expanded(
                  child: Text(
                    repository.fullName,
                    style: TextStyle(
                      fontSize: Dimensions.fontSizeOverLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Dimensions.sizedBoxLargeHeight,
            // Repository description
            Text(
              repository.description ?? "No description available.",
              style: TextStyle(fontSize: Dimensions.fontSizeDefault),
            ),
            Dimensions.sizedBoxLargeHeight,
            // Stats Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              elevation: Dimensions.elevation,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem(
                          Icons.code,
                          repository.language ?? "N/A",
                        ),
                        _buildStatItem(
                          Icons.star,
                          (repository.stars ?? 0).toString(),
                        ),
                        _buildStatItem(
                          Icons.update,
                          '${repository.updatedAt.year}-${repository.updatedAt.month}-${repository.updatedAt.day}',
                        ),
                      ],
                    ),
                    Dimensions.sizedBoxDefaultHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem(
                          Icons.call_split,
                          (repository.forksCount ?? 0).toString(),
                          title: "Forks",
                        ),
                        _buildStatItem(
                          Icons.remove_red_eye,
                          (repository.watchersCount ?? 0).toString(),
                          title: "Watchers",
                        ),
                        _buildStatItem(
                          Icons.error_outline,
                          (repository.openIssuesCount ?? 0).toString(),
                          title: "Issues",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Dimensions.sizedBoxLargeHeight,
            // Topics list
            if (repository.topics != null && repository.topics!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topics",
                    style: TextStyle(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Dimensions.sizedBoxSmallHeight,
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children:
                        repository.topics!.map((topic) {
                          return Chip(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: AppColor.primary,
                                width: Dimensions.borderWidthExtraSmall,
                              ),
                              borderRadius: BorderRadius.circular(
                                Dimensions.radiusLarge,
                              ),
                            ),
                            backgroundColor: AppColor.chipBg,
                            padding: EdgeInsets.all(0),
                            label: Text(
                              topic,
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeSmall,
                                color: AppColor.primary,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, {String? title}) {
    return Column(
      children: [
        Icon(icon, size: Dimensions.iconSizeDefault, color: AppColor.primary),
        Dimensions.sizedBoxExtraSmallHeight,
        Text(
          value,
          style: TextStyle(
            fontSize: Dimensions.fontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (title != null)
          Text(
            title,
            style: TextStyle(
              fontSize: Dimensions.fontSizeDefault,
              color: AppColor.dimText,
            ),
          ),
      ],
    );
  }
}
