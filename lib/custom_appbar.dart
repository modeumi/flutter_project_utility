import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utility/textstyle.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback action;
  final String content;
  final bool type;
  final Color? color;
  final VoidCallback? back_action;
  const CustomAppbar({
    super.key,
    required this.action,
    required this.content,
    required this.type,
    this.color,
    this.back_action,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      color: widget.color ?? Colors.white,
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        primary: false,
        title: SizedBox(
            height: 30,
            child: Center(
                child: widget.type
                    ? Image.asset(
                        widget.content,
                        fit: BoxFit.fitHeight,
                      )
                    : asText(widget.content, black(20, FontWeight.w600)))),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            if (widget.back_action != null) {
              widget.back_action!();
            } else {
              Get.back();
            }
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: widget.action,
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
    );
  }
}
