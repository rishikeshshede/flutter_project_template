import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project_template/utils/constants/app_constants.dart';
import 'package:flutter_project_template/utils/constants/local_keys.dart';
import 'package:flutter_project_template/utils/log_handler_util.dart';
import 'package:flutter_project_template/utils/persistence_handler_util.dart';
import 'package:mime/mime.dart';

// API Response model to structure the response data.
class ApiResponse {
  final bool success;
  final String url;
  final int? statusCode;
  final dynamic body;
  final dynamic error;

  ApiResponse({
    required this.success,
    required this.url,
    this.statusCode,
    this.body,
    this.error,
  });
}

class NetworkService {
  NetworkService._();
  static NetworkService? _instance;

  factory NetworkService() {
    _instance ??= NetworkService._();
    return _instance!;
  }

  static final String _baseUrl = dotenv.env['API_BASE_URL']!;

  // Fetching the Auth token once for use in headers.
  Future<String?> _getToken() async {
    String? token = await PersistenceHandler.get<String>(LocalKeys.authToken);
    return token;
  }

  // Reusable method for setting default headers.
  Map<String, String> _setDefaultHeaders(String? authToken) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": authToken ?? '',
    };
  }

  // Generic method for making HTTP requests.
  Future<ApiResponse> _makeRequest(String method, String endpoint,
      {Map<String, dynamic>? body}) async {
    final Uri url = Uri.parse(_baseUrl + endpoint);
    String? token = await _getToken();
    Map<String, String> headers = _setDefaultHeaders(token);

    LogHandlerUtil.i("${method.toUpperCase()}: $url");

    try {
      http.Response response;
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http
              .get(url, headers: headers)
              .timeout(AppConstants.apiTimeout);
          break;
        case 'POST':
          response = await http
              .post(url, headers: headers, body: json.encode(body))
              .timeout(AppConstants.apiTimeout);
          break;
        case 'PUT':
          response = await http
              .put(url, headers: headers, body: json.encode(body))
              .timeout(AppConstants.apiTimeout);
          break;
        case 'DELETE':
          response = await http
              .delete(url, headers: headers)
              .timeout(AppConstants.apiTimeout);
          break;
        default:
          throw ArgumentError('Invalid HTTP method: $method');
      }

      return _handleResponse(url, response);
    } catch (error) {
      return _handleError(url, error);
    }
  }

  // Handle the response from the API.
  ApiResponse _handleResponse(Uri url, http.Response response) {
    final int statusCode = response.statusCode;
    final String responseBody = response.body;
    final dynamic body = jsonDecode(responseBody);

    if (statusCode.toString().startsWith('2')) {
      return ApiResponse(
        success: true,
        statusCode: statusCode,
        url: url.toString(),
        body: body,
      );
    }

    return _handleError(url, body);
  }

  // Handle errors uniformly.
  ApiResponse _handleError(Uri url, dynamic error, {int? statusCode}) {
    LogHandlerUtil.e(
        'ERROR=> status code: $statusCode; url: ($url); error: $error');
    return ApiResponse(
      success: false,
      url: url.toString(),
      statusCode: statusCode,
      error: error,
    );
  }

  // GET request
  Future<ApiResponse> get(String endpoint) async {
    return await _makeRequest('GET', endpoint);
  }

  // POST request
  Future<ApiResponse> post(String endpoint, Map<String, dynamic> body) async {
    return await _makeRequest('POST', endpoint, body: body);
  }

  // PUT request
  Future<ApiResponse> put(String endpoint, Map<String, dynamic> body) async {
    return await _makeRequest('PUT', endpoint, body: body);
  }

  // DELETE request
  Future<ApiResponse> delete(String endpoint) async {
    return await _makeRequest('DELETE', endpoint);
  }

  // Upload image or video (can handle PUT or POST)
  Future<ApiResponse> uploadImageOrVideo(
      String endpoint, File imageFile, bool? update) async {
    final Uri url = Uri.parse(_baseUrl + endpoint);
    String? token = await _getToken();

    var request = http.MultipartRequest(update != null ? 'PUT' : 'POST', url)
      ..headers.addAll({
        'Authorization': token ?? '',
        'Content-Type': 'multipart/form-data',
      });

    try {
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType:
            MediaType.parse(lookupMimeType(imageFile.path) ?? 'image/jpeg'),
      ));

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseBody = jsonDecode(responseString);

      return ApiResponse(
        success: true,
        statusCode: response.statusCode,
        url: url.toString(),
        body: responseBody,
      );
    } catch (error) {
      return _handleError(url, error);
    }
  }

  // Upload file (POST method)
  Future<ApiResponse> uploadFile(String url, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var fileStream = http.ByteStream(file.openRead());
    var length = await file.length();
    var multipartFile = http.MultipartFile('file', fileStream, length,
        filename: file.path.split('/').last);

    request.files.add(multipartFile);

    try {
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseBody = jsonDecode(responseString);

      return ApiResponse(
        success: true,
        statusCode: response.statusCode,
        url: url,
        body: responseBody,
      );
    } catch (error) {
      return _handleError(Uri.parse(url), error);
    }
  }
}
