import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/chat.dart';
import 'package:get/get.dart';

class ChatProvider extends GetConnect {
  String route = 'chat/chats';
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

  Future<Response> getDataFromUsers(Map<dynamic, dynamic> data) async {
    try {
      final response = await DjangoAPI()
          .getData('$route/find/${data['user_1']}/${data['user_2']}');
      return response;
    } catch (e) {
      return Future.error(Exception(e));
    }
  }

  Future<Response> postData(Map<dynamic, dynamic> data) async {
    final response = await DjangoAPI().postData(route, data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }
}
