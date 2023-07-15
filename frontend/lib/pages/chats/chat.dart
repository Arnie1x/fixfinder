import 'package:fixfinder/controllers/messages.dart';
import 'package:fixfinder/pages/orders/order.dart';
import 'package:fixfinder/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends GetView<MessageController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MessageController(id: 1.toString()));
    return controller.obx((data) => Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (_) => const OrderWidget());
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
                              author: message.author! == 1 ? true : false,
                              message: message.body ?? 'Null',
                              time: message.createdAt!,
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
        )));
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
