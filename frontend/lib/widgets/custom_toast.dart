import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static void Function() toast(String text, {bool isError = false}) =>
      BotToast.showCustomText(
        toastBuilder: (_) => Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: isError ? Colors.red[900] : Colors.green[800]),
          child: Text(
            text,
          ),
        ),
      );

  static void Function() loadingIndicator() => BotToast.showCustomLoading(
      toastBuilder: (_) => const LinearProgressIndicator(),
      align: Alignment.topCenter);
}
