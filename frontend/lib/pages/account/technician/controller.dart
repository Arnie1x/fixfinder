import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/technician.dart';
import 'package:fixfinder/pages/technician/provider.dart';
import 'package:fixfinder/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianFormController extends GetxController
    with StateMixin<Technician> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Technician model;
  late int id;
  late int user;
  late bool editForm;

  TechnicianFormController({required this.id, this.editForm = false});

  late TextEditingController displayNameController,
      locationController,
      aboutController,
      servicesOfferedController;

  @override
  void onInit() async {
    super.onInit();
    displayNameController = TextEditingController();
    locationController = TextEditingController();
    aboutController = TextEditingController();
    servicesOfferedController = TextEditingController();
    if (id >= 0) {
      TechnicianProvider().getData(id).then((resp) {
        change(resp, status: RxStatus.success());
      }, onError: (err) {
        change(
          null,
          status: RxStatus.error(err.toString()),
        );
      });
      edit(await TechnicianProvider().getData(id));
    }
  }

  void edit(Technician technician) async {
    displayNameController.text = technician.name!;
    locationController.text = technician.location!;
    aboutController.text = technician.description!;
    servicesOfferedController.text = technician.services!;
    user = technician.user!;
    editForm = true;
  }

  @override
  void onClose() {
    super.onClose();
    disposeControllers();
  }

  void disposeControllers() {
    displayNameController.dispose();
    locationController.dispose();
    aboutController.dispose();
    servicesOfferedController.dispose();
  }

  String? validateText(String value) {
    if (value.isEmpty) {
      return "Please Enter Some Text";
    }
    return null;
  }

  void deleteRecord() async {
    var loading = CustomToast.loadingIndicator();
    final response =
        await DjangoAPI().deleteData('${TechnicianProvider().route}/$id');
    if (!response.status.hasError) {
      CustomToast.toast('Record Deleted Successfully');
    } else {
      CustomToast.toast('Error ${response.status.code}: Try Again',
          isError: true);
    }
    loading();
  }

  void submitForm() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    formKey.currentState!.save();
    var loading = CustomToast.loadingIndicator();
    model = Technician(
        name: displayNameController.text,
        location: locationController.text,
        description: aboutController.text,
        services: servicesOfferedController.text,
        user: user);

    final response = editForm
        ? await DjangoAPI()
            .putData('${TechnicianProvider().route}/$id', model.toJson())
        : await DjangoAPI()
            .postData(TechnicianProvider().route, model.toJson());
    if (!response.status.hasError) {
      CustomToast.toast(
          editForm ? 'Record Modified Successfully' : 'Record Created');
    } else {
      CustomToast.toast('Error ${response.status.code}: Try Again',
          isError: true);
    }
    loading();
  }
}
