import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/models/order.dart';
import 'package:fixfinder/pages/orders/provider.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:fixfinder/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController with StateMixin<List<Order>> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Order model;
  late int user = 1;
  late int technician = 1;
  late String orderState = 'pending';
  late bool editForm = false;
  late TextEditingController amountController;
  StorageService storageService = Get.find();

  OrderListController({required this.technician});

  @override
  void onInit() {
    amountController = TextEditingController();
    OrderProvider().getListData().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
      super.onInit();
    });
    user = storageService.box.read('id');
  }

  @override
  void onClose() {
    super.onClose();
    disposeControllers();
  }

  void disposeControllers() {
    amountController.dispose();
  }

  String? validateText(String value) {
    if (value.isEmpty) {
      return "Please Enter An Amount";
    }
    return null;
  }

  void edit(Order order, String state) async {
    amountController.text = order.amount.toString();
    orderState = state;
    editForm = true;
    submitForm();
  }

  void deleteRecord(int id) async {
    var loading = CustomToast.loadingIndicator();
    final response =
        await DjangoAPI().deleteData('${OrderProvider().route}/$id');
    if (!response.status.hasError) {
      CustomToast.toast('Record Deleted Successfully');
    } else {
      CustomToast.toast('Error ${response.status.code}: Try Again',
          isError: true);
    }
    loading();
  }

  void submitForm({id = 1}) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    formKey.currentState!.save();
    var loading = CustomToast.loadingIndicator();
    model = Order(
        amount: int.parse(amountController.text),
        state: orderState,
        technician: technician,
        user: user);

    final response = editForm
        ? await DjangoAPI()
            .putData('${OrderProvider().route}/$id', model.toJson())
        : await DjangoAPI().postData(OrderProvider().route, model.toJson());
    print(response.body);
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

class OrderController extends GetxController with StateMixin<Order> {
  late int id;
  OrderController({required this.id});
  @override
  void onInit() {
    OrderProvider().getData(id).then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
      super.onInit();
    });
  }
}
