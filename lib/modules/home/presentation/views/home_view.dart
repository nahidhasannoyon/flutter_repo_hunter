import 'package:flutter/material.dart';
import 'package:flutter_repo_hunter/modules/home/presentation/controllers/github_controller.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<GitHubController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trending Flutter Repositories")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return ListView.builder(
          itemCount: controller.repositories.length,
          itemBuilder: (context, index) {
            final repo = controller.repositories[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(repo.owner!.avatarUrl!),
              ),
              title: Text(repo.name!),
              subtitle: Text(repo.description!),
              trailing: Icon(Icons.star, color: Colors.amber),
            );
          },
        );
      }),
    );
  }
}
