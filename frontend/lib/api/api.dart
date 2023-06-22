import 'dart:convert';

import 'package:fixfinder/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

const baseUrl = 'http://127.0.0.1:8000';

class DjangoAPI extends GetConnect {
  StorageService storageService = Get.find();

  Future<void> refreshTokens() async {
    if (!JwtDecoder.isExpired(storageService.box.read('access'))) {
      final response = await post(
          '$baseUrl/token/refresh/', storageService.box.read('refresh'),
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
    await refreshTokens();
    final response = await get('$baseUrl/$route', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Token ${storageService.box.read('access')}'
    });
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }

// Post request
  Future<Response> postData(String route, Map data) async {
    await refreshTokens();
    final response = await post(
      '$baseUrl/$route/',
      jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token ${storageService.box.read('access')}'
      },
    );
    print(response.body);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }

// Put request
  Future<Response> putData(String route, Map data) async {
    await refreshTokens();
    final response = await put(
      '$baseUrl/$route/',
      jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
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
  Future<Response> deleteData(String route) async {
    await refreshTokens();
    final response = await delete(
      '$baseUrl/$route/',
      headers: {
        'Content-Type': 'application/json',
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
