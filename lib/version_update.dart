import 'dart:io';

import 'package:utile/import_package.dart';
import 'package:utile/textstyle.dart';

import 'package:flutter/material.dart';

class VersionUpdate extends StatefulWidget {
  final VoidCallback? action;
  const VersionUpdate({super.key, this.action});

  @override
  State<VersionUpdate> createState() => _VersionUpdateState();
}

class _VersionUpdateState extends State<VersionUpdate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      height: 1.0.sh,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
      child: Center(
        child: Container(
          width: 1.0.sw * 0.9,
          height: 1.0.sh * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: asText(
                  '업데이트 안내',
                  black(25, FontWeight.w700),
                  TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Text(
                  '새로운 업데이트가 발생하였습니다.\n원활한 사용을 위하여 앱을 업데이트 해주세요.',
                  style: black(20, FontWeight.w500),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.grey[300]!))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          exit(0);
                        },
                        child: Container(
                          decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey[300]!, width: 1))),
                          width: double.infinity,
                          child: Text(
                            '취소',
                            textAlign: TextAlign.center,
                            style: custom(20, FontWeight.w500, Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          widget.action!();
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            '업데이트',
                            textAlign: TextAlign.center,
                            style: custom(20, FontWeight.w500, Colors.blue),
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
}
