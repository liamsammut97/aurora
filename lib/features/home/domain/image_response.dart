import 'dart:convert';
import 'dart:ui';

ImageResponse imageResponseFromJson(String str) =>
    ImageResponse.fromJson(json.decode(str));

class ImageResponse {
  final String url;
  final Color? color;

  ImageResponse({required this.url, this.color});

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return ImageResponse(url: json['url'] as String);
  }
}
