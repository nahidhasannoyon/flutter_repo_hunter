import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class SortingButton extends StatelessWidget {
  const SortingButton({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
