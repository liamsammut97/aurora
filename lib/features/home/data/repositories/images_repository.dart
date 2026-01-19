import 'package:aurora/features/home/data/data_sources/get_images_datasource.dart';
import 'package:aurora/features/home/domain/image_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagesRepositoryProvider = Provider.autoDispose<ImagesRepository>(
  (ref) => ImagesRepository(),
);

class ImagesRepository {
  Future<ImageResponse> getImages() async {
    try {
      final response = await GetImagesDatasource.getImage();
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
