import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? helperText;
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool obscureText;
  final Widget? suffixIcon;
  const InputField(
      {super.key,
      required this.label,
      this.textEditingController,
      this.textInputAction,
      this.onSaved,
      this.validator,
      this.inputType,
      this.helperText,
      this.maxLines = 1,
      this.suffixIcon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLines > 1 ? (80 * 1.8).toDouble() : 70,
      child: TextFormField(
        validator: validator ??
            (a) {
              return null;
            },
        onSaved: onSaved ?? (a) {},
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: inputType ?? TextInputType.text,
        controller: textEditingController ?? TextEditingController(),
        obscureText: obscureText,
        maxLines: maxLines,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            labelText: label,
            border: const OutlineInputBorder(),
            helperText: helperText ?? "",
            errorStyle: const TextStyle(height: .5)),
      ),
    );
  }
}
