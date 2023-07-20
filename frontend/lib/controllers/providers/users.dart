import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/user.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  String route = 'api/users';
  late List<User> users;

  Future<List<User>> getListData() async {
    final response = await DjangoAPI().getData(route);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      users = <User>[];
      response.body.forEach((v) {
        users.add(User.fromJson(v));
      });
      return users;
    }
  }

  Future<User> getData(int messageId, int chatId) async {
    final response = await DjangoAPI().getData('$route/$chatId/messages');
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return User.fromJson(response.body);
    }
  }
}
