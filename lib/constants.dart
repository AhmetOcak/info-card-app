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
        color: accentColor,
      ),
      Text(
        text,
        style: myStyle.copyWith(
          fontSize: 20,
          color: accentColor,
        ),
      ),
    ],
  );
}

const Color backgroundColor = Color(0xFF000000);
const Color accentColor = Color(0xFFC9040E);
const Color textColor = Color(0xFFFFFFFF);

