import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/image_util.dart';
import '../controllers/github_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<GitHubController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Flutter Repositories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: controller.sortByStars,
            tooltip: 'Sort by Stars',
          ),
          IconButton(
            icon: const Icon(Icons.update),
            onPressed: controller.sortByUpdatedDate,
            tooltip: 'Sort by Updated Date',
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.repositories.isEmpty) {
          return const Center(child: Text('No repositories found.'));
        }
        return ListView.builder(
          itemCount: controller.repositories.length,
          itemBuilder: (context, index) {
            final repo = controller.repositories[index];
            return ListTile(
              leading: OwnerAvatar(avatarUrl: repo.owner?.avatarUrl ?? ''),
              title: Text(repo.name!),
              subtitle: Text(
                repo.description!.isNotEmpty
                    ? repo.description!
                    : 'No description',
              ),
              trailing: Text('${repo.stars} ⭐'),
            );
          },
        );
      }),
    );
  }
}
