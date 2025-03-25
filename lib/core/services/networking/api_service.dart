import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../../config/app_config.dart';
import '../../exceptions/api_exception.dart';

class ApiService extends GetConnect {
  ApiService() {
    httpClient.baseUrl = AppConfig.baseUrl;
    httpClient.timeout = const Duration(seconds: 60);

    /* ------------------------------- Headers ------------------------------ */
    httpClient.addRequestModifier((Request request) {
      request.headers['User-Agent'] = 'FlutterRepoHunter';
      request.headers['Accept'] = 'application/vnd.github+json';
      request.headers['X-GitHub-Api-Version'] = '2022-11-28';
      return request;
    });
  }

  Future<Response> getRequest(String uri, {Map<String, dynamic>? query}) async {
    try {
      final response = await get(uri, query: query);
      return _handleResponse(response);
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
      final response = await post(uri, body);
      return _handleResponse(response);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest(String uri, dynamic body) async {
    try {
      final response = await put(uri, body);
      return _handleResponse(response);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(String uri) async {
    try {
      final response = await delete(uri);
      return _handleResponse(response);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  // Handles response and checks if the API call was successful
  Response _handleResponse(Response response) {
    if (response.isOk) {
      // API request was successful
      return response;
    } else {
      // If the response is not successful, throw an API error
      throw ApiException(
        statusCode: response.statusCode!,
        message: _getErrorMessage(response.statusCode!),
      );
    }
  }

  // Provide custom error messages based on the status code
  String _getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request: The server could not understand the request.";
      case 401:
        return "Unauthorized: Authentication failed or user doesn't have permissions.";
      case 404:
        return "Not Found: The requested resource could not be found.";
      case 500:
        return "Internal Server Error: Something went wrong on the server.";
      default:
        return "An error occurred. Please try again later.";
    }
  }
}
