import 'dart:convert';

import 'package:fixfinder/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DjangoAPI extends GetConnect {
  final serverBaseUrl = 'http://127.0.0.1:8000';
  StorageService storageService = Get.find();

  Future<void> refreshTokens() async {
    if (!JwtDecoder.isExpired(storageService.box.read('access'))) {
      final response = await post(
          '$serverBaseUrl/token/refresh/', storageService.box.read('refresh'),
          headers: {
            'Content-Type': 'application/json',
          });
      if (response.status.hasError) {
        return Future.error(Exception(response.statusText));
      } else {
        storageService.box.write('access', response.body['access']);
        storageService.box.write('refresh', response.body['refresh']);
      }
    }
  }

// Get request
  Future<Response> getData(String route) async {
    // await refreshTokens();
    final response = await get('$serverBaseUrl/$route', headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Token ${storageService.box.read('access')}'
    });
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }

// Post request
  Future<Response> postData(String route, Map data) async {
    // await refreshTokens();
    final response = await post(
      '$serverBaseUrl/$route/',
      jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        if (storageService.box.read('access') != null)
          'Authorization': 'Token ${storageService.box.read('access')}'
      },
    );
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }

// Put request
  Future<Response> putData(String route, Map data) async {
    // await refreshTokens();
    final response = await put(
      '$serverBaseUrl/$route/',
      jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        if (storageService.box.read('access') != null)
          'Authorization': 'Token ${storageService.box.read('access')}'
      },
    );
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }

// Put request
  Future<Response> patchData(String route, Map data) async {
    // await refreshTokens();
    final response = await patch(
      '$serverBaseUrl/$route/',
      jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        if (storageService.box.read('access') != null)
          'Authorization': 'Token ${storageService.box.read('access')}'
      },
    );
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }

// Delete request
  Future<Response> deleteData(String route) async {
    // await refreshTokens();
    final response = await delete(
      '$serverBaseUrl/$route/',
      headers: {
        'Content-Type': 'application/json',
        if (storageService.box.read('access') != null)
          'Authorization': 'Token ${storageService.box.read('access')}'
      },
    );
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }

// Post request with File
// Future<Response<CasesModel>> postCases(List<int> image) {
//   final form = FormData({
//     'file': MultipartFile(image, filename: 'avatar.png'),
//     'otherFile': MultipartFile(image, filename: 'cover.png'),
//   });
//   return post('http://youapi/users/upload', form);
// }
}
