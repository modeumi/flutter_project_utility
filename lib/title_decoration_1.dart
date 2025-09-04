import 'package:flutter/material.dart';
import 'package:utile/color.dart';
import 'package:utile/textstyle.dart';

class TitleDecoration1 extends StatefulWidget {
  final String text;
  final Color? color;
  final double? font_size;

  const TitleDecoration1({super.key, required this.text, this.color, this.font_size});

  @override
  State<TitleDecoration1> createState() => _TitleDecoration1State();
}

class _TitleDecoration1State extends State<TitleDecoration1> {
  double? textHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _calculateTextHeight();
  }

  void _calculateTextHeight() {
    final TextSpan span = TextSpan(
      text: widget.text,
      style: DefaultTextStyle.of(context).style,
    );

    final TextPainter tp = TextPainter(
      text: span,
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );

    tp.layout();

    setState(() {
      textHeight = tp.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 텍스트 높이가 아직 계산 안됐으면 빈 컨테이너나 로딩 표시 가능
    if (textHeight == null) {
      return const SizedBox();
    }

    return Row(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 5,
          height: textHeight!, // 텍스트 높이의 2배
          color: widget.color ?? color_black,
        ),
        Text(
          widget.text,
          style: black(widget.font_size ?? 20, FontWeight.w700),
        ),
      ],
    );
  }
}
