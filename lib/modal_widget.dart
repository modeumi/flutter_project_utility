import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:utile/color.dart';
import 'package:utile/textstyle.dart';

class ModalWidget extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback action;
  const ModalWidget({super.key, required this.title, required this.content, required this.action});

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 10,
      child: Container(
          width: 1.0.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color_white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1.0.sw,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: color_grey))),
                child: Center(child: asText(widget.title, custom(20, FontWeight.w700, color_black))),
              ),
              Container(
                width: 1.0.sw,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: color_grey)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  widget.content,
                  style: custom(17, FontWeight.w500, color_black),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(right: BorderSide(width: 0.5, color: mobilhi_grey_1)),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Text(
                            '아니오',
                            style: custom(15, FontWeight.w700, color_grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        widget.action();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(width: 0.5, color: mobilhi_grey_1)),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Text(
                            '예',
                            style: custom(15, FontWeight.w700, color_black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
