import 'package:aurora/api/api_client.dart';
import 'package:aurora/features/home/presentation/screens/images_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  NetworkClient();
  runApp(ProviderScope(child: MaterialApp(home: const ImagesScreen())));
}
