import 'package:utile/color.dart';

import 'package:utile/textstyle.dart';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ToastMessage {
  void ShowToast(String message, [String? type]) {
    showToastWidget(
      duration: const Duration(seconds: 3),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          type == 'bottom' ? Spacer() : Container(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 150),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20),
                color: back_grey.withOpacity(0.7)),
            child: Center(
              child: AutoSizeText(
                textAlign: TextAlign.center,
                message,
                style: black(20, FontWeight.w600),
                maxLines: 3,
                minFontSize: 15,
              ),
            ),
          ),
          type == 'top' ? Spacer() : Container()
        ],
      ),
    );
  }
}
