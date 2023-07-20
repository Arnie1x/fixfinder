import 'package:fixfinder/controllers/providers/users.dart';
import 'package:fixfinder/models/technician.dart';
import 'package:fixfinder/models/user.dart';
import 'package:fixfinder/pages/technician/provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController();
  late RxList<User> usersList = <User>[].obs;
  late RxList<Technician> techniciansList = <Technician>[].obs;
  static UserController instance = Get.find();
  @override
  void onInit() async {
    super.onInit();
    refreshList();
  }

  void refreshList() async {
    usersList.value = await UserProvider().getListData();
    techniciansList.value = await TechnicianProvider().getListData();
    usersList.refresh();
    techniciansList.refresh();
  }
}
