import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({super.key, required this.repo});

  final RepositoryModel repo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => RepoDetailsView(repository: repo));
      },
      child: Container(
        margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          border: Border(
            bottom: BorderSide(
              color: AppColor.dimText,
              width: Dimensions.borderWidthExtraSmall,
            ),
            left: BorderSide(
              color: AppColor.dimText,
              width: Dimensions.borderWidthExtraSmall,
            ),
            right: BorderSide(
              color: AppColor.dimText,
              width: Dimensions.borderWidthExtraSmall,
            ),
            top: BorderSide(
              color: AppColor.dimText,
              width: Dimensions.borderWidthExtraSmall,
            ),
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: Dimensions.imageSizeExtraSmall,
                  height: Dimensions.imageSizeExtraSmall,
                  child: OwnerAvatar(avatarUrl: repo.owner.avatarUrl ?? ''),
                ),
                Dimensions.sizedBoxSmallHeight,
                SizedBox(
                  width: Get.width * 0.7,
                  child: Text(
                    repo.fullName,
                    style: TextStyle(
                      fontSize: Dimensions.iconSizeSmall,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Dimensions.sizedBoxSmallWidth,
              ],
            ),
            Dimensions.sizedBoxSmallHeight,
            Text(
              repo.description!.isNotEmpty
                  ? repo.description!.length > 100
                      ? '${repo.description!.substring(0, 100)}...'
                      : repo.description!
                  : 'No description',
            ),
            SizedBox(height: 5),
            // show only up to 5 topics
            Wrap(
              spacing: 5,
              children:
                  repo.topics!
                      .take(4)
                      .map(
                        (topic) => Chip(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.blue,
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
                              fontSize: Dimensions.fontSizeExtraSmall,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
            Dimensions.sizedBoxExtraSmallHeight,
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.code, color: AppColor.primary),
                    Dimensions.sizedBoxExtraSmallWidth,
                    Text(repo.language ?? 'N/A'),
                  ],
                ),
                Text('  |  '),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: Dimensions.iconSizeSmall,
                      color: AppColor.star,
                    ),
                    Dimensions.sizedBoxExtraSmallWidth,
                    Text('${repo.stars}'),
                  ],
                ),
                Text('  |  '),
                Row(
                  children: [
                    Icon(
                      Icons.update,
                      size: Dimensions.iconSizeSmall,
                      color: AppColor.green,
                    ),
                    Dimensions.sizedBoxExtraSmallWidth,
                    Text(
                      '${repo.updatedAt.year}-${repo.updatedAt.month}-${repo.updatedAt.day}',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
