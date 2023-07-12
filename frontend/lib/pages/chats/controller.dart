import 'package:fixfinder/models/chat.dart';
import 'package:fixfinder/pages/chats/provider.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController with StateMixin<List<Chat>> {
  @override
  void onInit() {
    ChatProvider().getListData().then((resp) {
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

class ChatController extends GetxController with StateMixin<Chat> {
  late int id;
  ChatController({required this.id});
  @override
  void onInit() {
    ChatProvider().getData(id).then((resp) {
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
