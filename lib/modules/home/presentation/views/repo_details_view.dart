import 'package:flutter/material.dart';

import '../../../../data/models/repository_model.dart';

class RepoDetailsView extends StatelessWidget {
  final RepositoryModel repository;

  const RepoDetailsView({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repository.fullName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with owner avatar and repository full name
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      (repository.owner.avatarUrl?.isNotEmpty ?? false)
                          ? NetworkImage(repository.owner.avatarUrl!)
                          : null,
                  child:
                      (repository.owner.avatarUrl?.isEmpty ?? true)
                          ? const Icon(Icons.person, size: 40)
                          : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    repository.fullName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Repository description
            Text(
              repository.description ?? "No description available.",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Stats Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
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
                    const SizedBox(height: 16),
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
            const SizedBox(height: 20),
            // Topics list
            if (repository.topics != null && repository.topics!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Topics",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children:
                        repository.topics!.map((topic) {
                          return Chip(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Colors.lightBlue[50],
                            padding: EdgeInsets.all(0),
                            label: Text(
                              topic,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
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
        Icon(icon, size: 28, color: Colors.blueGrey),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (title != null)
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
