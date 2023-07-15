import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/order.dart';
import 'package:get/get.dart';

class OrderProvider extends GetConnect {
  String route = 'api/orders';
  late List<Order> orders;

  Future<List<Order>> getListData() async {
    final response = await DjangoAPI().getData(route);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      orders = <Order>[];
      response.body.forEach((v) {
        orders.add(Order.fromJson(v));
      });
      return orders;
    }
  }

  Future<Order> getData(int id) async {
    final response = await DjangoAPI().getData('$route/$id');
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return Order.fromJson(response.body);
    }
  }
}
