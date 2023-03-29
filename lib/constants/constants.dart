import 'package:flutter/material.dart';

import '../components/game_icon.dart';

const Color backgroundColor = Color(0xff00897b);
const Color primaryTextColor = Color(0xffffab40);
const Color secondaryTextColor = Color(0xfffafafa);

 RichText ticTacToeString =  RichText(
  text: TextSpan(
    children: [
      buildTextSpan('T', primaryTextColor),
      buildTextSpan('i', secondaryTextColor),
      buildTextSpan('c', primaryTextColor),
      buildTextSpan(' T', primaryTextColor),
      buildTextSpan('a', secondaryTextColor),
      buildTextSpan('c', primaryTextColor),
      buildTextSpan(' T', primaryTextColor),
      buildTextSpan('o', secondaryTextColor),
      buildTextSpan('e', primaryTextColor),
    ],
  ),
);
TextSpan buildTextSpan(String text, Color color) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

const Icon defaultIcon =  Icon(Icons.circle,size: 100,color: Color(0xff004d40));

GameIcon player1 = const GameIcon(icon: Icons.star, player: 1);
GameIcon player2 = const GameIcon(icon: Icons.circle, player: 2);