import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game_app/screens/game_screen.dart';


import 'components/game_icon.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/game':((context) => const GameScreen()),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                GameIcon(icon: Icons.star, player: 1),
                GameIcon(icon: Icons.circle, player: 2),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }

  TextSpan buildTextSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 70,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

// Color(0xfff57c00),
// Color(0xfafafa)
