import 'package:aurora/features/home/domain/image_response.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class AnimatedImageContainer extends StatefulWidget {
  final ImageResponse imageData;
  final GestureTapCallback onTap;

  const AnimatedImageContainer({
    super.key,
    required this.imageData,
    required this.onTap,
  });

  @override
  State<AnimatedImageContainer> createState() => _AnimatedImageContainerState();
}

class _AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  String? _currentUrl;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didUpdateWidget(AnimatedImageContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset animation if URL changes
    if (oldWidget.imageData.url != widget.imageData.url) {
      _currentUrl = null;
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      color:
          widget.imageData.color == Colors.transparent
              ? Colors.black
              : widget.imageData.color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExtendedImage.network(
              widget.imageData.url,
              fit: BoxFit.contain,
              cache: true,
              loadStateChanged: (state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    );

                  case LoadState.completed:
                    // Only animate once per image
                    if (_currentUrl != widget.imageData.url) {
                      _currentUrl = widget.imageData.url;
                      _controller.forward(from: 0.0);
                    }

                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: state.completedWidget,
                      ),
                    );

                  case LoadState.failed:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load image',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    );
                }
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: widget.onTap, child: Text("Another")),
          ],
        ),
      ),
    );
  }
}
