// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utility/color.dart';
import 'package:utility/textstyle.dart';

class ModalWidget extends StatefulWidget {
  final String title;
  final String? content;
  final Widget? contentWidget;
  final bool? select_button;
  final double? width;
  final VoidCallback action;
  final VoidCallback? cancle;
  final String? submitButtonContent;
  final String? cancleButtonContent;
  final Widget? customWidget;
  const ModalWidget(
      {Key? key,
      required this.title,
      this.content,
      this.contentWidget,
      this.select_button,
      this.width,
      required this.action,
      this.cancle,
      this.submitButtonContent,
      this.cancleButtonContent,
      this.customWidget})
      : super(key: key);

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 10,
      child: widget.customWidget ??
          Container(
              width: widget.width ?? double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color_white,
              ),
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: color_grey))),
                    child: Center(child: asText(widget.title, custom(20, FontWeight.w700, color_black))),
                  ),
                  if (widget.content != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Text(
                        widget.content!,
                        style: custom(17, FontWeight.w500, color_black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (widget.contentWidget != null) widget.contentWidget!,
                  if (widget.select_button ?? false)
                    GestureDetector(
                      onTap: () {
                        try {
                          Get.back();
                        } catch (e) {
                          Navigator.pop(context);
                        }
                        widget.action();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: color_grey))),
                        child: Center(
                          child: Text(
                            '확인',
                            style: black(20, FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: color_grey))),
                        child: Row(
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  try {
                                    Get.back();
                                  } catch (e) {
                                    Navigator.pop(context);
                                  }
                                  if (widget.cancle != null) {
                                    widget.cancle!();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(right: BorderSide(width: 0.5, color: color_grey)),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                    child: Text(
                                      widget.cancleButtonContent ?? '아니오',
                                      style: custom(20, FontWeight.w700, color_grey),
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
                                    border: Border(left: BorderSide(width: 0.5, color: color_grey)),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                    child: Text(
                                      widget.submitButtonContent ?? '예',
                                      style: custom(20, FontWeight.w700, color_black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                ],
              )),
    );
  }
}
