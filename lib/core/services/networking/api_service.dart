import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';
import '../../helpers/translation_helper.dart';

class ApiService extends GetConnect {
  static final GetStorage _storage = GetStorage();
  late String token;
  late String lang;

  ApiService() {
    token = _storage.read(AppStrings.userLoginToken) ?? '';
    lang =
        _storage.read(AppStrings.langKey) ??
        '${TranslationHelper.locale.languageCode}_${TranslationHelper.locale.countryCode}';

    httpClient.baseUrl = AppConstants.baseUrl;
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.defaultContentType = 'application/json; charset=UTF-8';
    // Add request modifier for adding headers to all requests
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer $token';
      request.headers[AppStrings.langKey] = lang;
      return request;
    });

    // Default decoder for automatic response body decoding
    httpClient.defaultDecoder = (response) {
      try {
        if (response.body is String) {
          return response.body.isNotEmpty ? jsonDecode(response.body) : {};
        } else if (response.body is List) {
          return response.body;
        } else {
          return response.body;
        }
      } catch (e) {
        throw FormatException("Failed to decode the response");
      }
    };

    // Add response modifier for handling response asynchronously
    httpClient.addResponseModifier<Response<dynamic>>((
      request,
      response,
    ) async {
      if (response.statusCode == 200) {
        return response; // Return successful response as is
      } else if (response.statusCode == 401) {
        // Handle unauthorized response asynchronously if needed
        throw Exception("Unauthorized request. Please login again.");
      } else if (response.statusCode == 500) {
        // Handle server error asynchronously if needed
        throw Exception("Server error occurred. Please try again later.");
      } else {
        // Handle other status codes or response errors
        throw Exception("Error: ${response.statusCode}");
      }
    });

    // httpClient.defaultResponseInterceptor
  }

  void updateHeader(String newToken, String newCountryCode) {
    token = newToken;
    lang = newCountryCode;
    _storage.write(AppStrings.userLoginToken, token);
    _storage.write(AppStrings.langKey, lang);
  }

  Future<Response> getRequest(String uri, {Map<String, dynamic>? query}) async {
    try {
      return await get(uri, query: query);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest(String uri, dynamic body) async {
    try {
      return await post(uri, body);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest(String uri, dynamic body) async {
    try {
      return await put(uri, body);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(String uri) async {
    try {
      return await delete(uri);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }
}
