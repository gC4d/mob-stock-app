// ignore_for_file: unnecessary_brace_in_string_interps
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:uno/uno.dart';

import 'package:mob_storage_app/src/core/configuration/env/env.dart';

class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: Env.i['base_url'] ?? '',
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }
  RestClient auth() {
    return this;
  }

  RestClient unauth() {
    return this;
  }
}
