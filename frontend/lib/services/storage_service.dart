import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage box;
  Future<StorageService> init() async {
    await GetStorage.init();
    box = GetStorage();
    return this;
  }
}
