import 'package:aurora/features/home/presentation/controllers/images_controller.dart';
import 'package:aurora/features/home/presentation/widgets/animated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagesScreen extends ConsumerWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(imagesControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: images.when(
        data: (data) {
          if (data == null) {
            return const Center(
              child: Text(
                "Oh no we couldn't find any images",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return AnimatedImageContainer(
            imageData: data,
            onTap: () {
              ref.invalidate(imagesControllerProvider);
            },
          );
        },
        error:
            (error, stack) => Center(
              child: Text(
                error.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
        loading:
            () => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
      ),
    );
  }
}
