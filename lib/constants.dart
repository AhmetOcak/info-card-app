import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle myStyle = TextStyle(
  fontSize: 35,
  fontFamily: 'ScheherazadeNew',
  color: textColor,
);

Column emptyCardWarning(BuildContext context, String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.block_outlined,
        size: MediaQuery.of(context).size.width / 7,
        color: cardColor,
      ),
      Text(
        text,
        style: myStyle.copyWith(
          fontSize: 20,
          color: cardColor,
        ),
      ),
    ],
  );
}

const Color cardColor = Color(0xFF0A1045);
const Color backgroundColor = Color(0xFF00C2D1);
const Color accentColor = Color(0xFFF9E900);
const Color textColor = Color(0xFFEAFFDA);
const Color buttonColor = Color(0xFFFF570A);
