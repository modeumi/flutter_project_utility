import 'package:utility/textstyle.dart';

import 'package:flutter/material.dart';

Widget Show_Dialog(Widget title, Widget content, VoidCallback action, VoidCallback cancle, TextStyle approval,
    [bool? disable_cancle, String? apply_text, String? cancle_text, bool? disableButton]) {
  return Dialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20),
    elevation: 10,
    child: Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      // constraints: const BoxConstraints(maxHeight: double.infinity * 0.6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title,
            Padding(
              padding: const EdgeInsets.all(
                15.0,
              ),
              child: content,
            ),
            if ((disableButton ?? false) == false)
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.grey[300]!))),
                child: disable_cancle ?? false
                    ? GestureDetector(
                        onTap: () {
                          action();
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              apply_text ?? '확인',
                              textAlign: TextAlign.center,
                              style: approval,
                            ),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 5,
                            child: GestureDetector(
                              onTap: () {
                                cancle();
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: double.infinity,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    cancle_text ?? '취소',
                                    textAlign: TextAlign.center,
                                    style: grey(18, FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey[300]!, width: 1))),
                          ),
                          Flexible(
                            flex: 5,
                            child: GestureDetector(
                              onTap: () {
                                action();
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: double.infinity,
                                height: double.infinity,
                                child: Center(
                                  child: Text(
                                    apply_text ?? '확인',
                                    textAlign: TextAlign.center,
                                    style: approval,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              )
          ],
        ),
      ),
    ),
  );
}
