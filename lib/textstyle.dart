import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

TextStyle black(double size, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: Color(0xFF141414),
  );
}

TextStyle white(double size, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: Colors.white,
  );
}

TextStyle grey(double size, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: const Color(0xFFA9A9A9),
  );
}

TextStyle deepgrey(double size, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: const Color(0xFF696969),
  );
}

TextStyle orange(double size, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: const Color(0xFFFF6E00),
  );
}

TextStyle green(double size, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: const Color(0xFF047732),
  );
}

TextStyle lightrange(double size, FontWeight weight) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: const Color(0xFFFFA764),
  );
}

TextStyle custom(double size, FontWeight weight, Color color, [TextDecoration? deco, Color? deco_color = Colors.black, double? height]) {
  return TextStyle(
      fontFamily: 'Pretendard', fontSize: size, fontWeight: weight, color: color, decoration: deco, decorationColor: deco_color, height: height);
}

TextStyle orange_wh(double size, FontWeight weight, double height) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    color: const Color(0xFFFF6E00),
    height: height,
  );
}

AutoSizeText asText(String text, TextStyle style, [TextAlign? align, TextOverflow? overflow, int? maxlines]) {
  return AutoSizeText(
    text,
    style: style,
    textAlign: align,
    maxLines: maxlines ?? 1,
    minFontSize: 3,
    overflow: overflow,
  );
}

Flexible Flex_asText(int flex, String text, TextStyle style, [TextAlign? aling, TextOverflow? overflow, int? maxline]) {
  return Flexible(
    flex: flex,
    child: AutoSizeText(
      text,
      style: style,
      textAlign: aling,
      overflow: overflow,
      maxLines: maxline ?? 1,
      minFontSize: 5,
    ),
  );
}
