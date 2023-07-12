import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/chat.dart';
import 'package:get/get.dart';

class ChatProvider extends GetConnect {
  String route = 'api/technicians';
  late List<Chat> chats;

  Future<List<Chat>> getListData() async {
    final response = await DjangoAPI().getData(route);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      chats = <Chat>[];
      response.body.forEach((v) {
        chats.add(Chat.fromJson(v));
      });
      return chats;
    }
  }

  Future<Chat> getData(int id) async {
    final response = await DjangoAPI().getData('$route/$id');
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return Chat.fromJson(response.body);
    }
  }
}
