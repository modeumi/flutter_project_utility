import 'package:flutter/material.dart';
import 'package:utile/color.dart';
import 'dart:ui' as ui;

import 'package:utile/textstyle.dart';

class AccentTitle extends StatefulWidget {
  final String title;
  final Color? accent_color;
  final double? font_size;
  const AccentTitle({super.key, required this.title, this.accent_color, this.font_size});

  @override
  State<AccentTitle> createState() => _AccentTitleState();
}

class _AccentTitleState extends State<AccentTitle> {
  double color_field = 0;

  @override
  void initState() {
    super.initState();
    getTextSize();
  }

  void getTextSize() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: widget.title, style: black(20, FontWeight.w600)),
      textDirection: ui.TextDirection.ltr,
    )..layout(); // 레이아웃 계산 실행
    setState(() {
      color_field = textPainter.size.width + 15; // 글자의 width, height 반환
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: asText(widget.title, black(widget.font_size ?? 20, FontWeight.w600)),
        ),
        Row(
          children: [
            Container(
              height: 4,
              width: color_field,
              decoration: BoxDecoration(color: widget.accent_color ?? color_black),
            ),
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(color: color_lightgrey),
              ),
            )
          ],
        )
      ],
    );
  }
}
