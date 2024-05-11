// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks

// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

// Project imports:
import '../singleton/statics.dart';

class ApplicationInterceptor extends InterceptorsWrapper {

  ApplicationInterceptor()
      : super(
    onRequest: (options, handler) async {
      final Map<String, dynamic> headers = {};
      headers["Authorization"] = "Bearer ${box.getSaveData(key: keys.token)}";
      headers["Accept"]="application/json";


      final customOptions = options;
      customOptions.headers = headers;


      customOptions.connectTimeout =const Duration(milliseconds: 5000);

      kDebugMode? log('with URL ${customOptions.uri}') : null;
      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {

        return handler.resolve(
          Response(requestOptions: customOptions,statusCode: 100,statusMessage: "No internet connection"),
        );
      } else {
        return handler.next(customOptions);
      }
    },
    onResponse: (response, handler) {

      return handler.next(response);
    },
    onError: (error, handler) {


      if(error.type.name == 'connectionTimeout' || error.type.name == 'receiveTimeout'||  error.type.name == 'connectionError'){
        return handler.resolve( Response(requestOptions: RequestOptions(),statusCode: 101,statusMessage: "No internet connection"),);
      }
      if (error.response != null) {
        return handler.resolve(error.response!);
      } else {

        return handler.next(error);

      }
    },
  );
}
