import 'package:aurora/features/home/application/images_service.dart';
import 'package:aurora/features/home/domain/image_response.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'images_controller.g.dart';

@riverpod
class ImagesController extends _$ImagesController {
  @override
  FutureOr<ImageResponse?> build() async {
    return getImages();
  }

  Future<ImageResponse?> getImages() async {
    final image = await ref.read(imagesServiceProvider).getImagesWithoutColor();

    // Show image immediately with transparent/default color
    state = AsyncValue.data(
      ImageResponse(url: image.url, color: Colors.transparent),
    );

    // Then update color in background
    // this prevents hanging if the extraction takes long
    _updateColorInBackground(image.url);

    return state.value;
  }

  Future<void> _updateColorInBackground(String url) async {
    try {
      final color = await ref
          .read(imagesServiceProvider)
          .getColorFromImage(url);

      if (state.value?.url == url) {
        state = AsyncValue.data(ImageResponse(url: url, color: color));
      }
    } catch (e) {
      print('Failed to extract color: $e');
    }
  }

  // Optional: Method to load a new image
  Future<void> loadNewImage() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => getImages());
  }
}
