import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/technician.dart';
import 'package:get/get.dart';

class TechnicianProvider extends GetConnect {
  String route = 'api/technicians';
  late List<Technician> technicians;

  Future<List<Technician>> getListData() async {
    final response = await DjangoAPI().getData(route);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      technicians = <Technician>[];
      response.body.forEach((v) {
        technicians.add(Technician.fromJson(v));
      });
      return technicians;
    }
  }

  Future<Technician> getData() async {
    final response = await DjangoAPI().getData(route);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return Technician.fromJson(response.body);
    }
  }
}
