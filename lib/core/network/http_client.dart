/// @author Diky Nugraha Difiera
/// @email dikynugraha1111@gmail.com
/// @create date 2024-03-24 14:22:33
/// @modify date 2024-03-24 14:22:33
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:next_test/core/network/app_exception.dart';

abstract class HttpClient<T> {
  Future<T> delete(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> get(
    Uri url,
    Map<String, String>? headers, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> post(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> put(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> patch(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> multipartPost(
    Uri url,
    Map<String, String> headers,
    Map<String, File> files,
    Map<String, String>? fields, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
}

class AppHttpClient implements HttpClient {
  final http.Client _client;
  // final AppCrashlytic _crashlytic;

  AppHttpClient(
    this._client,
    // this._crashlytic,
  );

  @override
  Future<http.Response> delete(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.delete(
        url,
        headers: headers,
        body: body,
      );

      // if (!kIsWeb) {
      //   if (customAllowedStatusCode != null
      //       ? !(customAllowedStatusCode.contains(response.statusCode))
      //       : !(response.statusCode == 200 || response.statusCode == 201)) {
      //     FirebaseCrashlytics.instance.recordError(
      //       _crashlytic.exception(response),
      //       stackTrace ?? StackTrace.current,
      //       reason: _crashlytic.reason(response),
      //       fatal: true,
      //     );
      //     await FirebaseCrashlytics.instance.sendUnsentReports();
      //   }
      // }
      // if (alice != null) alice!.onHttpResponse(response);
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw AppException(exception.toString());
    }
  }

  @override
  Future<http.Response> get(
    Uri url,
    Map<String, String>? headers, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.get(
        url,
        headers: headers,
      );

      // if (!kIsWeb) {
      //   if (customAllowedStatusCode != null
      //       ? !(customAllowedStatusCode.contains(response.statusCode))
      //       : !(response.statusCode == 200 || response.statusCode == 201)) {
      //     FirebaseCrashlytics.instance.recordError(
      //       _crashlytic.exception(response),
      //       stackTrace ?? StackTrace.current,
      //       reason: _crashlytic.reason(response),
      //       fatal: true,
      //     );
      //     await FirebaseCrashlytics.instance.sendUnsentReports();
      //   }
      // }

      // if (alice != null) alice!.onHttpResponse(response);
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw AppException(exception.toString());
    }
  }

  @override
  Future<http.Response> post(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.post(
        url,
        headers: headers,
        body: body,
      );

      // if (!kIsWeb) {
      //   if (customAllowedStatusCode != null
      //       ? !(customAllowedStatusCode.contains(response.statusCode))
      //       : !(response.statusCode == 200 || response.statusCode == 201)) {
      //     FirebaseCrashlytics.instance.recordError(
      //       _crashlytic.exception(response),
      //       stackTrace ?? StackTrace.current,
      //       reason: _crashlytic.reason(response),
      //       fatal: true,
      //     );
      //     await FirebaseCrashlytics.instance.sendUnsentReports();
      //   }
      // }

      // if (alice != null) alice!.onHttpResponse(response);
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw AppException(exception.toString());
    }
  }

  @override
  Future<http.Response> put(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.put(
        url,
        headers: headers,
        body: body,
      );

      // if (!kIsWeb) {
      //   if (customAllowedStatusCode != null
      //       ? !(customAllowedStatusCode.contains(response.statusCode))
      //       : !(response.statusCode == 200 || response.statusCode == 201)) {
      //     FirebaseCrashlytics.instance.recordError(
      //       _crashlytic.exception(response),
      //       stackTrace ?? StackTrace.current,
      //       reason: _crashlytic.reason(response),
      //       fatal: true,
      //     );
      //     await FirebaseCrashlytics.instance.sendUnsentReports();
      //   }
      // }

      // if (alice != null) alice!.onHttpResponse(response);
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw AppException(exception.toString());
    }
  }

  @override
  Future<http.Response> patch(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.patch(
        url,
        headers: headers,
        body: body,
      );

      // if (!kIsWeb) {
      //   if (customAllowedStatusCode != null
      //       ? !(customAllowedStatusCode.contains(response.statusCode))
      //       : !(response.statusCode == 200 || response.statusCode == 201)) {
      //     FirebaseCrashlytics.instance.recordError(
      //       _crashlytic.exception(response),
      //       stackTrace ?? StackTrace.current,
      //       reason: _crashlytic.reason(response),
      //       fatal: true,
      //     );
      //     await FirebaseCrashlytics.instance.sendUnsentReports();
      //   }
      // }

      // if (alice != null) alice!.onHttpResponse(response);
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw AppException(exception.toString());
    }
  }

  @override
  Future<http.Response> multipartPost(
    Uri url,
    Map<String, String> headers,
    Map<String, File> files,
    Map<String, String>? fields, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    files.forEach((key, value) {
      request.files.add(http.MultipartFile.fromBytes(
        key,
        value.readAsBytesSync(),
        filename: value.path.split('/').last,
      ));
    });

    final streamedResponse = await request.send();

    final response = await http.Response.fromStream(streamedResponse);

    // if (!kIsWeb) {
    //   if (customAllowedStatusCode != null
    //       ? !(customAllowedStatusCode.contains(streamedResponse.statusCode))
    //       : !(streamedResponse.statusCode == 200 ||
    //           streamedResponse.statusCode == 201)) {
    //     FirebaseCrashlytics.instance.recordError(
    //       streamedResponse,
    //       stackTrace ?? StackTrace.current,
    //       reason: streamedResponse,
    //       fatal: true,
    //     );
    //     await FirebaseCrashlytics.instance.sendUnsentReports();
    //   }
    // }

    return response;
  }

  factory AppHttpClient.create() {
    return AppHttpClient(
      http.Client(),
      // AppCrashlyticImpl(),
    );
  }
}
