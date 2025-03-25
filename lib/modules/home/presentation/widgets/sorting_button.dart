import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class SortingButton extends GetView<HomeController> {
  const SortingButton({super.key});

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
                            controller.sortMethod.value == SortMethod.stars
                                ? AppColor.primary
                                : null,
                      ),
                      title: Text(
                        'Sort by Stars',
                        style: TextStyle(
                          color:
                              controller.sortMethod.value == SortMethod.stars
                                  ? AppColor.primary
                                  : null,
                        ),
                      ),
                      selected: controller.sortMethod.value == SortMethod.stars,
                      onTap:
                          controller.sortMethod.value == SortMethod.stars
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
                            controller.sortMethod.value == SortMethod.updated
                                ? AppColor.primary
                                : null,
                      ),
                      title: Text(
                        'Sort by Updated Date',
                        style: TextStyle(
                          color:
                              controller.sortMethod.value == SortMethod.updated
                                  ? AppColor.primary
                                  : null,
                        ),
                      ),
                      selected:
                          controller.sortMethod.value == SortMethod.updated,
                      onTap:
                          controller.sortMethod.value == SortMethod.updated
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
