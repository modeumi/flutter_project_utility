import 'package:utility/color.dart';
import 'package:utility/import_package.dart';

import 'package:utility/textstyle.dart';

import 'package:flutter/material.dart';

class PushButton extends StatefulWidget {
  final String content;
  final VoidCallback action;
  final Color color;
  final bool? state;
  final Color? deactivate;
  final double? fontsize;
  final Color? fontcolor;
  const PushButton(
      {super.key, required this.content, required this.action, this.fontsize, required this.color, this.fontcolor, this.state, this.deactivate});

  @override
  State<PushButton> createState() => _PushButtonState();
}

class _PushButtonState extends State<PushButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
      child: Container(
        width: 1.0.sw,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: (widget.state ?? false) ? widget.color : widget.deactivate),
        child: Center(
          child: Text(widget.content, style: custom(widget.fontsize ?? 16, FontWeight.w500, widget.fontcolor ?? color_black)),
        ),
      ),
    );
  }
}
