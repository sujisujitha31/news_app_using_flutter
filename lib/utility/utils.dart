import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TextWithDmSansFont extends StatelessWidget {
  const TextWithDmSansFont({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 13.0,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines,
    this.decoration,
    this.height,
  });
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.dmSans(
        height: height,
        decoration: decoration,
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
      overflow: overflow,
      softWrap: false,
    );
  }
}

createCustomDateFormat(DateTime? day) {
  if (day != null)
    return "${day.day} ${DateFormat.MMM().format(day)} ${day.year}";
  else
    return "";
}
