import 'package:fixfinder/api/api.dart';
import 'package:get/get.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class RegisterProvider extends GetConnect {
  final String route = 'auth/register/';

  Future<Response> postData(Map<dynamic, dynamic> data) async {
    final response = await DjangoAPI().postData(route, data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response;
    }
  }
}
