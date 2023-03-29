import 'package:flutter/material.dart';

import '../constants/constants.dart';

class GameIcon extends StatelessWidget {
 const  GameIcon({super.key,  required this.icon, required this.player});
   final IconData icon;
  final int player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text('Player $player',style:  const TextStyle(color: Colors.white),),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2,color: primaryTextColor),
          ),
          child:  CircleAvatar(
            backgroundColor: const Color(0xff00695c),
            radius: 50,
            child: Icon(
              icon,
              size: 100,
              color: primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}