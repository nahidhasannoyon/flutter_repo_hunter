import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Flutter Repositories'),
        elevation: 5,
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
            return HomeListTile(repo: repo);
          },
        );
      }),
      floatingActionButton: SortingButton(),
    );
  }
}
