import 'dart:convert';

import 'package:fixfinder/controllers/providers/messages.dart';
import 'package:fixfinder/models/message.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageController extends GetxController {
  late RxList<Message> messageList = <Message>[].obs;
  final String id;
  final String technicianId;
  MessageController({required this.id, required this.technicianId});
  StorageService storageService = Get.find();
  late TextEditingController messageController;

  // List<Message> get messages => messageList.value.obs;

  late WebSocketChannel channel;

  @override
  void onInit() async {
    super.onInit();
    channel = WebSocketChannel.connect(Uri.parse(
        'ws://127.0.0.1:8000/ws/api/technicians/$technicianId/chat/$id/'));
    messageController = TextEditingController();
    messageList.value = await MessageProvider().getListData(int.parse(id));
    messageList.refresh();
    // getMessages();

    channel.stream.listen((event) {
      getMessages();
    });
  }

  @override
  void onClose() {
    super.onClose();
    channel.sink.close();
  }

  Future<void> getMessages() async {
    Future.delayed(const Duration(milliseconds: 1000));
    messageList.value = await MessageProvider().getListData(int.parse(id));
    messageList.refresh();
    print(messageList);
  }

  // Stream<List<Message>> messageStream() {
  //   return channel.stream.map((event) {
  //     return <Message>[
  //       Message(
  //         chat: 1,
  //         author: 1,
  //         body: 'Test Body',
  //       )
  //     ];
  //   }).asBroadcastStream();
  // }

  void sendMessage() async {
    await channel.ready;
    if (messageController.text.isNotEmpty) {
      final map = {
        "message": messageController.text,
        "author": storageService.box.read('id') ?? 1
      };
      messageList.add(Message(author: 1, body: messageController.text));
      channel.sink.add(jsonEncode(map));
      messageController.text = '';
    }
  }

  Stream<dynamic> messageStream() {
    final stream = channel.stream;
    return stream.asBroadcastStream();
  }
}
