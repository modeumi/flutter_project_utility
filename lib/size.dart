import 'package:flutter/material.dart';

double full_width(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return screenSize.width;
}

double full_height(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return screenSize.height;
}
