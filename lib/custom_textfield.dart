import 'package:utility/color.dart';
import 'package:utility/textstyle.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color color;
  final bool? password;
  final VoidCallback? action;
  final int? maxline;
  final double? fontSize;
  final bool? keyboardType;
  final bool? readOnly;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.password,
    this.action,
    required this.color,
    this.maxline,
    this.fontSize,
    this.keyboardType,
    this.readOnly,
  });

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
          style: black(widget.fontSize ?? 18, FontWeight.w600),
        ),
        Container(
          decoration: BoxDecoration(
            color: widget.readOnly ?? false ? back_grey_2 : color_white,
          ),
          child: TextSelectionTheme(
            data: TextSelectionThemeData(selectionHandleColor: widget.color),
            child: TextField(
              controller: widget.controller,
              obscureText: widget.password ?? false,
              style: black(widget.fontSize ?? 18, FontWeight.w400),
              cursorColor: widget.color,
              maxLines: widget.maxline,
              keyboardType: widget.keyboardType ?? false ? TextInputType.number : null,
              autofocus: false,
              readOnly: widget.readOnly ?? false,
              onChanged: (value) {
                widget.action?.call();
              },
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: color_black)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  hintText: '${widget.hint}를 입력해주세요.',
                  hintStyle: grey(widget.fontSize ?? 18, FontWeight.w500),
                  focusColor: widget.color),
            ),
          ),
        ),
      ],
    );
  }
}
