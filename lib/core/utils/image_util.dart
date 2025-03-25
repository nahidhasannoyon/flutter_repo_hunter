import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class ImageUtils {
  static Future<File> getImageFromCache(String url) async {
    // Try to get the image from the cache manager first
    final cacheManager = DefaultCacheManager();
    final fileInfo = await cacheManager.getFileFromCache(url);

    if (fileInfo != null) {
      // Image found in cache, return it
      return fileInfo.file;
    } else {
      // Image not found in cache, download it
      final file = await downloadImage(url);
      return file;
    }
  }

  static Future<File> downloadImage(String url) async {
    final cacheManager = DefaultCacheManager();
    final file = await cacheManager.getSingleFile(url);
    return file;
  }
}

class OwnerAvatar extends StatelessWidget {
  final String avatarUrl;

  const OwnerAvatar({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: ImageUtils.getImageFromCache(avatarUrl), // Get image from cache
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show while loading
        } else if (snapshot.hasError) {
          return Icon(Icons.error); // Show error if the image fails
        } else if (snapshot.hasData) {
          return Image.file(
            snapshot.data!,
          ); // Show the cached or downloaded image
        } else {
          return Icon(Icons.image_not_supported); // Fallback if no image found
        }
      },
    );
  }
}
