import 'package:fixfinder/models/technician.dart';
import 'package:fixfinder/pages/technician/provider.dart';
import 'package:get/get.dart';

class TechnicianListController extends GetxController
    with StateMixin<List<Technician>> {
  @override
  void onInit() {
    TechnicianProvider().getListData().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
      super.onInit();
    });
  }
}

class TechnicianController extends GetxController with StateMixin<Technician> {
  late int id;
  TechnicianController({required this.id});
  @override
  void onInit() {
    TechnicianProvider().getData(id).then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
      super.onInit();
    });
  }
}
