import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/message.dart';
import 'package:get/get.dart';

class MessageProvider extends GetConnect {
  String route = 'chat/chats';
  late List<Message> messages;

  Future<List<Message>> getListData(int chatId) async {
    final response = await DjangoAPI().getData('$route/$chatId/messages');
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      messages = <Message>[];
      response.body.forEach((v) {
        messages.add(Message.fromJson(v));
      });
      return messages;
    }
  }

  Future<Message> getData(int messageId, int chatId) async {
    final response = await DjangoAPI().getData('$route/$chatId/messages');
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return Message.fromJson(response.body);
    }
  }
}
