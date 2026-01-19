import 'package:aurora/api/api_client.dart';
import 'package:aurora/config/constants.dart';
import 'package:aurora/features/home/domain/image_response.dart';

class GetImagesDatasource {
  static Future<ImageResponse> getImage() async {
    final response = await NetworkClient.client.get(
      "${Constants.baseUrl}/image",
    );

    return imageResponseFromJson(response.toString());
  }
}
