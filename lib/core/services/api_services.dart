import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_task/core/config/app_config.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 401:
        return json.decode(response.body);
      case 400:
        throw Exception('Bad request: ${response.body}');
      case 403:
        throw Exception('Unauthorized: ${response.body}');
      case 500:
        throw Exception('Server error: ${response.body}');
      default:
        throw Exception('Unexpected error: ${response.body}');
    }
  }

  /// GET request (token optional)
  Future<dynamic> getApi({String? endPoint}) async {
    String url = '${AppConfig.baseURL}$endPoint';
    try {
      final response = await http.get(Uri.parse(url));
      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timeout');
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }
}
