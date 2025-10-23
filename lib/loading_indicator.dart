import 'package:flutter/material.dart';
import 'package:utility/color.dart';
import 'package:utility/import_package.dart';

class LoadingIndicator extends StatefulWidget {
  final Color? color;
  const LoadingIndicator({super.key, this.color});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(child: LoadingAnimationWidget.threeArchedCircle(color: widget.color ?? color_black, size: 50));
  }
}
