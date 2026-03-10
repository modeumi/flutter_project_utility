import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:utility/color.dart';
import 'package:utility/textstyle.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void alertMessage(String message, String type, [bool? appExit]) {
  Color baseColor() {
    if (type == 'success') {
      return color_blue;
    } else if (type == 'warning') {
      return Colors.orange;
    } else if (type == 'fail') {
      return color_red;
    } else {
      return color_black;
    }
  }

  Get.dialog(
    Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 0.8.sw,
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: color_white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: custom(18, FontWeight.w500, color_black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (appExit != null && appExit)
                // 취소 및 종료
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: color_grey),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(child: Text('취소', style: grey(16, FontWeight.w500))),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          exit(0);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: color_red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(child: Text('종료', style: custom(16, FontWeight.w500, color_white))),
                        ),
                      ),
                    ),
                  ],
                )
              else
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: baseColor(),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(child: Text('확인', style: custom(16, FontWeight.w500, color_white))),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
    barrierColor: Colors.black.withValues(alpha: 0.2),
  );
}
