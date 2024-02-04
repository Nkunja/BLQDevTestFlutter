import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/values/colors.dart';

class Inter extends StatelessWidget {
  final bool italic;
  final Color color;
  final double size;
  final String text;
  final int? maxLines;
  final bool? softWrap;
  final Locale? locale;
  final TextStyle? style;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final StrutStyle? strutStyle;
  final TextOverflow? overFlow;
  final double? textScaleFactor;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const Inter(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w400;

  const Inter.thin(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w100;

  const Inter.semiLight(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w200;

  const Inter.light(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w300;

  const Inter.medium(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w500;

  const Inter.semiBold(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w600;

  const Inter.bold(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w700;

  const Inter.black(
    this.text, {
    super.key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.white,
    this.textAlign = TextAlign.start,
  }) : fontWeight = FontWeight.w900;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      locale: locale,
      maxLines: maxLines,
      overflow: overFlow,
      softWrap: softWrap,
      textAlign: textAlign,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      style: style != null
          ? GoogleFonts.inter(
              fontSize: size.sp,
              color: style!.color,
              locale: style!.locale,
              height: style!.height,
              fontWeight: fontWeight,
              shadows: style!.shadows,
              foreground: style!.foreground,
              background: style!.background,
              decoration: style!.decoration,
              wordSpacing: style!.wordSpacing,
              textBaseline: style!.textBaseline,
              fontFeatures: style!.fontFeatures,
              letterSpacing: style!.letterSpacing,
              backgroundColor: style!.backgroundColor,
              decorationColor: style!.decorationColor,
              decorationStyle: style!.decorationStyle,
              decorationThickness: style!.decorationThickness,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            )
          : GoogleFonts.inter(
              color: color,
              fontSize: size.sp,
              fontWeight: fontWeight,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            ),
    );
  }
}
