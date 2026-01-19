// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ImagesController)
const imagesControllerProvider = ImagesControllerProvider._();

final class ImagesControllerProvider
    extends $AsyncNotifierProvider<ImagesController, ImageResponse?> {
  const ImagesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imagesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imagesControllerHash();

  @$internal
  @override
  ImagesController create() => ImagesController();
}

String _$imagesControllerHash() => r'a24816e32a97523daf4427b884db0a696d5e0c12';

abstract class _$ImagesController extends $AsyncNotifier<ImageResponse?> {
  FutureOr<ImageResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ImageResponse?>, ImageResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ImageResponse?>, ImageResponse?>,
              AsyncValue<ImageResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
