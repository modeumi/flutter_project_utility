import 'package:utile/textstyle.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool password;
  final Color color;
  final VoidCallback? action;
  const CustomTextField({super.key, required this.hint, required this.controller, required this.password, this.action, required this.color});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hint,
          style: black(16, FontWeight.w600),
        ),
        TextSelectionTheme(
          data: TextSelectionThemeData(selectionHandleColor: widget.color),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.password,
            style: black(18, FontWeight.w400),
            cursorColor: widget.color,
            onChanged: (value) {
              widget.action?.call();
            },
            decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                hintText: '${widget.hint}를 입력해주세요.',
                hintStyle: grey(20, FontWeight.w500),
                focusColor: widget.color),
          ),
        ),
      ],
    );
  }
}
