import 'package:fixfinder/models/chat.dart';
import 'package:fixfinder/models/technician.dart';
import 'package:fixfinder/pages/chats/controller.dart';
import 'package:fixfinder/pages/chats/provider.dart';
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

  void openChat({int user1 = -1, int user2 = -1}) async {
    if (user1 > -1 && user2 > -1) {
      Chat chatModel = Chat(user_1: user1, user_2: user2);
      // final response =
      //     await ChatProvider().getDataFromUsers(chatModel.toJson());
      // if (response.body != null) {
      //   chatModel = Chat.fromJson(response.body);
      // } else {
      //   final response = await ChatProvider().postData(chatModel.toJson());
      // }
      final map = {
        'user_1': user1,
        'user_2': 1,
      };
      // TODO: Add a check for existing chats so that we don't get HTTP 400 Errors
      await ChatProvider().postData(map);
      ChatListController chatListController = Get.find();
      chatListController.refreshList();
    }
  }
}
