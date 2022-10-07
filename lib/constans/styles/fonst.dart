import 'package:flutter/material.dart';
import 'package:movie_app_db_iti_task/constans/styles/styles.dart';

TextStyle get titleStyle {
  return const TextStyle(
      fontSize: 20, fontFamily: 'Montserrat', letterSpacing: 2);
}

TextStyle get movieTitle {
  return const TextStyle(
      color: white,
      letterSpacing: 1,
      fontSize: 20,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w900);
}

TextStyle get bodyStyle {
  return const TextStyle(
      color: darkGreyClr,
      letterSpacing: 1,
      fontSize: 20,
      fontFamily: 'Muli',
      fontWeight: FontWeight.w500);
}

TextStyle get subBodyStyle {
  return const TextStyle(
      color: darkHeaderClr,
      fontSize: 13,
      fontFamily: 'Muli',
      fontWeight: FontWeight.w500);
}
