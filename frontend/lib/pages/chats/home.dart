import 'dart:math';

import 'package:fixfinder/controllers/navigation_controller.dart';
import 'package:fixfinder/controllers/users.dart';
import 'package:fixfinder/pages/chats/controller.dart';
import 'package:fixfinder/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHomePage extends GetView<ChatListController> {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<ChatListController>();
    Get.put(ChatListController());
    return Obx(() => Column(
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
            if (controller.chatList.isEmpty) const Text('No Chats Yet'),
            Column(
              children: controller.chatList
                  .map((chat) => Material(
                        child: InkWell(
                          onTap: () {
                            NavigationController.instance.messagesBeamerKey
                                .currentState?.routerDelegate
                                .beamToNamed(
                                    '${Routes.chatsRoute}/${chat.id}/${chat.user_2}',
                                    data: {"chat_name": 'Chat'});
                          },
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
                                    '',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.2,
                                  ),
                                ),
                              ),
                              // title: Text(UserController.instance.usersList
                              //         .firstWhere((element) =>
                              //             chat.user_1 == element.id)
                              //         .username ??
                              //     ''),
                              title: Text(UserController.instance.usersList
                                      .firstWhere((element) =>
                                          chat.user_1 == element.id)
                                      .username ??
                                  ''),
                              // title: Text(chat.user_1.toString()),
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
