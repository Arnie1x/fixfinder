import 'package:fixfinder/pages/orders/controller.dart';
import 'package:fixfinder/pages/orders/order_item.dart';
import 'package:fixfinder/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderWidget extends GetView<OrderListController> {
  final int technicianId;
  const OrderWidget({super.key, required this.technicianId});

  @override
  Widget build(BuildContext context) {
    Get.delete<OrderListController>();
    Get.put(OrderListController(technician: technicianId));
    return controller.obx((data) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'New Order',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                // Order Widget
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputField(
                        label: 'Amount',
                        textEditingController: controller.amountController,
                        validator: (value) => controller.validateText(value!),
                        inputType: TextInputType.number,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButton(
                            onPressed: () {
                              controller.submitForm();
                              Navigator.pop(context);
                            },
                            style: FilledButton.styleFrom(
                              fixedSize: const Size.fromHeight(40),
                            ),
                            child: const Text('Initiate Order'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size.fromHeight(40),
                              foregroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                            child: const Text('Discard'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Past Orders',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                Column(
                  children: data?.reversed
                          .map((e) => OrderItem(
                                order: e,
                                onStateChanged: (value) {
                                  controller.edit(e, value!);
                                  Navigator.pop(context);
                                },
                                onDelete: () {
                                  controller.deleteRecord(e.id!);
                                  Navigator.pop(context);
                                },
                              ))
                          .toList() ??
                      [const Text('No Orders Yet')],
                ),
              ],
            ),
          ),
        ));
  }
}
