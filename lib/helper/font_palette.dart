import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rynoz/helper/color_palette.dart';

class FontPalette {
  static const themeFont = "Poppins";

  //Light => w300
  //Regular => w400
  //Medium => w500
  //Semi Bold => w600
  //Bold => w700
  //Extra Bold => w800

//blue
  static TextStyle blue13600 = GoogleFonts.roboto(
      fontSize: 13.sp, color: HexColor("#2388C4"), fontWeight: FontWeight.w600);
  static TextStyle blue13500 = GoogleFonts.roboto(
      fontSize: 13.sp, color: HexColor("#2388C4"), fontWeight: FontWeight.w500);
  static TextStyle blue16400 = GoogleFonts.roboto(
      fontSize: 16.sp, color: HexColor("#2388C4"), fontWeight: FontWeight.w400);
  static TextStyle blue16700 = GoogleFonts.roboto(
      fontSize: 16.sp, color: HexColor("#2388C4"), fontWeight: FontWeight.w700);

  static TextStyle blue11500 = GoogleFonts.roboto(
      fontSize: 11.sp, color: HexColor("#2388C4"), fontWeight: FontWeight.w500);
  static TextStyle black10500 = GoogleFonts.roboto(
      fontSize: 10.sp, color: Colors.black, fontWeight: FontWeight.w500);

  //black
  static TextStyle black35700 = GoogleFonts.roboto(
      fontSize: 35.sp, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle black21600 = GoogleFonts.roboto(
      fontSize: 21.sp, color: Colors.black, fontWeight: FontWeight.w600);

  static TextStyle black36600 = GoogleFonts.roboto(
      fontSize: 36.sp, color: Colors.black, fontWeight: FontWeight.w600);

  static TextStyle black18500 = GoogleFonts.roboto(
      fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w500);
  static TextStyle black17500 = GoogleFonts.roboto(
      fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w500);

  static TextStyle black13400 = GoogleFonts.roboto(
      fontSize: 13.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle black13500 = GoogleFonts.roboto(
      fontSize: 13.sp, color: Colors.black, fontWeight: FontWeight.w500);
  static TextStyle black14500 = GoogleFonts.roboto(
      fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500);
  static TextStyle black13700 = GoogleFonts.roboto(
      fontSize: 13.sp, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle black16500 = GoogleFonts.roboto(
      fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w500);

  static TextStyle black15400 = GoogleFonts.roboto(
      fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle black15500 = GoogleFonts.roboto(
      fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.w500);

  static TextStyle black16400 = GoogleFonts.roboto(
      fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle black16700 = GoogleFonts.roboto(
      fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle black12400 = GoogleFonts.roboto(
      fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle black11500 = GoogleFonts.roboto(
      fontSize: 11.sp, color: Colors.black, fontWeight: FontWeight.w500);
  static TextStyle black7400 = GoogleFonts.roboto(
      fontSize: 7.5.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle black11300 = GoogleFonts.roboto(
      fontSize: 11.sp, color: Colors.black, fontWeight: FontWeight.w300);

  static TextStyle black12500underline = GoogleFonts.roboto(
      fontSize: 12.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      textStyle: const TextStyle(decoration: TextDecoration.underline));

  //green
  static TextStyle green15500 = GoogleFonts.roboto(
      fontSize: 15.sp, color: HexColor("#37C423"), fontWeight: FontWeight.w500);
  static TextStyle green13400 = GoogleFonts.roboto(
      fontSize: 13.sp, color: HexColor("#37C423"), fontWeight: FontWeight.w400);

  //white
  static TextStyle white18600 = GoogleFonts.roboto(
      fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600);

  //grey
  static TextStyle grey12500 = GoogleFonts.roboto(
      fontSize: 12.sp, color: HexColor("#B9B5B5"), fontWeight: FontWeight.w500);
  static TextStyle grey13500 = GoogleFonts.roboto(
      fontSize: 13.sp, color: HexColor("#B9B5B5"), fontWeight: FontWeight.w500);
  static TextStyle grey14500 = GoogleFonts.roboto(
      fontSize: 14.sp, color: HexColor("#B9B5B5"), fontWeight: FontWeight.w500);

  static TextStyle grey16400 = GoogleFonts.roboto(
      fontSize: 16.sp, color: HexColor("#B9B5B5"), fontWeight: FontWeight.w400);
  static TextStyle grey14600 = GoogleFonts.roboto(
      fontSize: 14.sp, color: HexColor("#B9B5B5"), fontWeight: FontWeight.w400);
}
