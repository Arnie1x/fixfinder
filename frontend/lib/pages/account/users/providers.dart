import 'package:fixfinder/api/api.dart';
import 'package:get/get.dart';

class PasswordProvider extends GetConnect {
  final String route = 'auth/password/change';

  Future<Response> postData(Map<dynamic, dynamic> data) async {
    final response = await DjangoAPI().postData(route, data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }
}

class UserAccountProvider extends GetConnect {
  final String route = 'auth/user';

  Future<Response> postData(Map<dynamic, dynamic> data) async {
    final response = await DjangoAPI().postData(route, data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }
}
