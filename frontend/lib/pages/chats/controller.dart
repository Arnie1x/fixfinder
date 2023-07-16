import 'package:fixfinder/models/chat.dart';
import 'package:fixfinder/pages/chats/provider.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  late RxList<Chat> chatList = <Chat>[].obs;
  @override
  void onInit() {
    super.onInit();
    refreshList();
  }

  void refreshList() async {
    Future.delayed(const Duration(milliseconds: 250));
    chatList.value = await ChatProvider().getListData();
    chatList.refresh();
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
