import 'package:flutter/material.dart';
import '../../../../data/models/repository_model.dart';

class RepoDetailsView extends StatelessWidget {
  final RepositoryModel repository;

  const RepoDetailsView({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repository.name!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${repository.name}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Description: ${repository.description ?? "No description"}',
              ),
              const SizedBox(height: 8),
              Text('Stars: ${repository.stars}'),
            ],
          ),
        ),
      ),
    );
  }
}
