import "package:flutter/material.dart";

const String comfortaaFontFamily = "Comfortaa";
const FontWeight comfortaaLight = FontWeight.w300;
const FontWeight comfortaaRegular = FontWeight.w400;
const FontWeight comfortaaMedium = FontWeight.w500;
const FontWeight comfortaaSemiBold = FontWeight.w600;
const FontWeight comfortaaBold = FontWeight.w700;

TextStyle comfortaaTextStyle({
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 16,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontFamily: comfortaaFontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}
