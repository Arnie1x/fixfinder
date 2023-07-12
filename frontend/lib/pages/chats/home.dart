import 'dart:math';

import 'package:fixfinder/pages/chats/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHomePage extends GetView<ChatListController> {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<ChatListController>();
    Get.put(ChatListController());
    return controller.obx((data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Chats',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            const SizedBox(
              height: 20,
            ),
            const Text('No Chats Yet'),
            Column(
              children: data!
                  .map((chat) => Material(
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                                child: const Align(
                                  heightFactor: 5,
                                  child: Text(
                                    'A',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.2,
                                  ),
                                ),
                              ),
                              title: Text(chat.user_1.toString()),
                              subtitle: Text(chat.user_2.toString()),
                              visualDensity: VisualDensity.comfortable,
                              enableFeedback: true,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}
