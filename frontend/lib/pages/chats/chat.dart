import 'package:beamer/beamer.dart';
import 'package:fixfinder/controllers/messages.dart';
import 'package:fixfinder/controllers/navigation_controller.dart';
import 'package:fixfinder/pages/orders/order.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:fixfinder/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends GetView<MessageController> {
  final int id;
  final int technicianId;
  const ChatPage({super.key, required this.id, required this.technicianId});

  @override
  Widget build(BuildContext context) {
    Get.delete<MessageController>();
    Get.put(MessageController(
        id: id.toString(), technicianId: technicianId.toString()));
    StorageService storageService = Get.find();
    var name = context.currentBeamLocation.data;
    if (name != null) {
      name = name as Map<String, String>;
    }
    print(name);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                NavigationController
                    .instance.messagesBeamerKey.currentState?.routerDelegate
                    .beamBack();
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) => OrderWidget(
                            technicianId: technicianId,
                          ));
                },
                icon: const Icon(Icons.more_vert_outlined))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() => Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: controller.messageList.reversed
                          .map(
                            (message) => ChatBubble(
                              author: message.author! ==
                                      storageService.box.read('id')
                                  ? true
                                  : false,
                              message: message.body ?? 'Null',
                              time: message.createdAt ?? 'Null',
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )),
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 5,
            //     itemBuilder: (context, index) {
            //       return const ChatBubble(author: true, message: 'Message');
            //     }),
            InputField(
              label: 'Enter Message',
              textEditingController: controller.messageController,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.send_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  controller.sendMessage();
                },
              ),
            ),
          ],
        ));
  }
}

class ChatBubble extends StatelessWidget {
  final bool author;
  final String message;
  final String time;
  const ChatBubble(
      {super.key,
      required this.author,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          if (author) Expanded(child: Container()),
          Expanded(
            flex: 4,
            child: Container(
              alignment: author ? Alignment.centerRight : Alignment.centerLeft,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: author
                      ? Theme.of(context).colorScheme.tertiaryContainer
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment:
                    author ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: author
                            ? Theme.of(context).colorScheme.onTertiaryContainer
                            : Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  Text(
                    dateParse(time),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
          if (!author) Expanded(child: Container())
        ],
      ),
    );
  }

  String dateParse(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    if (date
        .toLocal()
        .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      return '${DateFormat.MMMd().format(DateTime.parse(dateTime).toLocal())} ${DateFormat.jm().format(DateTime.parse(dateTime).toLocal())}';
    }
    return DateFormat.jm().format(DateTime.parse(dateTime).toLocal());
  }
}
