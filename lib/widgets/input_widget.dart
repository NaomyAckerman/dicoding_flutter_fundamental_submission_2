import 'package:flutter/material.dart';
import 'package:submission_proyek2/common/styles.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {super.key,
      this.controller,
      this.onEditingComplete,
      this.textInputAction,
      required this.hintText,
      this.keyboardType});

  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 253, 226),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: primaryColor,
          width: 0.1,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: TextField(
        controller: controller,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 12, color: Colors.grey),
        ),
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }
}
