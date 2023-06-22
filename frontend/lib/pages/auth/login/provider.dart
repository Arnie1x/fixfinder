import 'package:fixfinder/api/api.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  final String route = 'auth/login';

  Future<Response> postData(Map<dynamic, dynamic> data) async {
    final response = await DjangoAPI().postData(route, data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }
}
