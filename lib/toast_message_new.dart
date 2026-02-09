import 'package:flutter/material.dart';
import 'package:utility/color.dart';
import 'package:utility/import_package.dart';
import 'package:utility/textstyle.dart';

void Success_Message(String message) {
  showToastWidget(
      duration: const Duration(seconds: 2),
      Center(
        child: Container(
          width: 1.0.sw,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          decoration: BoxDecoration(color: color_white, borderRadius: BorderRadius.circular(8.0), border: Border.all(width: 1, color: color_black)),
          child: Text(
            message,
            style: black(20, FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ));
}
