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
    return InkWell(
      onTap: () {
        Get.to(() => RepoDetailsView(repository: repo));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.5),
            left: BorderSide(color: Colors.grey, width: 0.5),
            right: BorderSide(color: Colors.grey, width: 0.5),
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: OwnerAvatar(avatarUrl: repo.owner.avatarUrl ?? ''),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: Get.width * 0.7,
                  child: Text(
                    repo.fullName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 5),
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
                            side: BorderSide(color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.lightBlue[50],
                          padding: EdgeInsets.all(0),
                          label: Text(
                            topic,
                            style: TextStyle(fontSize: 10, color: Colors.blue),
                          ),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.code, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(repo.language ?? 'N/A'),
                  ],
                ),
                Text('  |  '),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: 16,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 5),
                    Text('${repo.stars}'),
                  ],
                ),
                Text('  |  '),
                Row(
                  children: [
                    Icon(Icons.update, size: 16, color: Colors.green),
                    SizedBox(width: 5),
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
