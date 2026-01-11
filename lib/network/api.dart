import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class Api {
  static const String baseUrl = "https://172.16.19.11";
  final Dio dio = Dio()
    ..httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
}
