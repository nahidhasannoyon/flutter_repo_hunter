import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/image_util.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending Flutter Repositories')),
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
                    ? repo.description!.length > 100
                        ? '${repo.description!.substring(0, 100)}...'
                        : repo.description!
                    : 'No description',
              ),
              trailing: Text('${repo.stars} ⭐'),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Obx(
                () => SafeArea(
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.star,
                          color:
                              controller.sortMethod.value == 'stars'
                                  ? Theme.of(context).primaryColor
                                  : null,
                        ),
                        title: Text(
                          'Sort by Stars',
                          style: TextStyle(
                            color:
                                controller.sortMethod.value == 'stars'
                                    ? Theme.of(context).primaryColor
                                    : null,
                          ),
                        ),
                        selected: controller.sortMethod.value == 'stars',
                        onTap:
                            controller.sortMethod.value == 'stars'
                                ? null
                                : () {
                                  Get.back();
                                  controller.sortByStars();
                                },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.update,
                          color:
                              controller.sortMethod.value == 'updated'
                                  ? Theme.of(context).primaryColor
                                  : null,
                        ),
                        title: Text(
                          'Sort by Updated Date',
                          style: TextStyle(
                            color:
                                controller.sortMethod.value == 'updated'
                                    ? Theme.of(context).primaryColor
                                    : null,
                          ),
                        ),
                        selected: controller.sortMethod.value == 'updated',
                        onTap:
                            controller.sortMethod.value == 'updated'
                                ? null
                                : () {
                                  Get.back();
                                  controller.sortByUpdatedDate();
                                },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: 'Sort Options',
        child: const Icon(Icons.sort),
      ),
    );
  }
}
