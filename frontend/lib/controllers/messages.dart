import 'dart:convert';

import 'package:fixfinder/controllers/providers/messages.dart';
import 'package:fixfinder/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageController extends GetxController with StateMixin<List<Message>> {
  final String id;
  MessageController({required this.id});

  late TextEditingController messageController;

  RxList<Message> messageList = <Message>[].obs;
  // List<Message> get messages => messageList.value.obs;

  final channel = WebSocketChannel.connect(
      Uri.parse('ws://127.0.0.1:8000/ws/api/technicians/2/chat/1/'));

  @override
  void onInit() async {
    super.onInit();
    messageController = TextEditingController();
    MessageProvider().getListData(int.parse(id)).then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
    // messageList.bindStream(messageStream());
    // dynamicMessageList.bindStream(messageStream());
    getMessages();

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
      final map = {"message": messageController.text, "author": 1};
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
