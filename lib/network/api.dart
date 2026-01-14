import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';

class Api {
  static const String baseUrl = "https://172.16.19.11";
  final Dio dio;

  Api() : dio = Dio() {
    // Allow invalid SSL certificates
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }
}
//     // Simple logger
//     dio.interceptors.add(PrettyDioLogger());

//     // Custom logger configuration
//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//         enabled: kDebugMode,
//         filter: (options, args) {
//           // don't print requests with uris containing '/posts'
//           if (options.path.contains('/posts')) {
//             return false;
//           }
//           // don't print responses with unit8 list data
//           return !args.isResponse || !args.hasUint8ListData;
//         },
//       ),
//     );
//   }
// }
