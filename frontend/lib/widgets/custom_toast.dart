import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static void Function() toast(String text, {bool isError = false}) =>
      BotToast.showCustomText(
        duration: const Duration(seconds: 5),
        toastBuilder: (_) => Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color:
                  isError ? const Color(0xFFBA1A1A) : const Color(0xFF006A67)),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  static void Function() loadingIndicator() => BotToast.showCustomLoading(
      toastBuilder: (_) => const LinearProgressIndicator(),
      align: Alignment.topCenter);
}
