import 'package:aurora/features/home/data/repositories/images_repository.dart';
import 'package:aurora/features/home/domain/image_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

final imagesServiceProvider = Provider.autoDispose<ImagesService>((ref) {
  return ImagesService(imagesRepository: ref.read(imagesRepositoryProvider));
});

//here is were application logic is handled

class ImagesService {
  final ImagesRepository imagesRepository;

  ImagesService({required this.imagesRepository});
  // Get image without waiting for color
  Future<ImageResponse> getImagesWithoutColor() async {
    return await imagesRepository.getImages();
  }

  Future<Color> getColorFromImage(String url) async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(
        NetworkImage(url),
        size: const Size(50, 50),
        maximumColorCount: 10,
      );
      return palette.dominantColor?.color ?? Colors.black;
    } catch (e) {
      return Colors.black;
    }
  }
}
