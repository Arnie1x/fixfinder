import 'package:fixfinder/services/storage_service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    return this;
  }

  Future<void> setLoginToken(String accessToken, String refreshToken) async {
    StorageService storageService = Get.find();
    storageService.box.write("accessToken", accessToken);
    storageService.box.write("refreshToken", refreshToken);
  }
}
