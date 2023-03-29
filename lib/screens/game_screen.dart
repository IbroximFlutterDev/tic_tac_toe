import 'package:flutter/material.dart';

import '../constants/constants.dart';




class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const Icon player1 = Icon(
    Icons.star,
    color: primaryTextColor,
    size: 100,
  );
  static Icon player2 = const Icon(
    Icons.circle,
    color: primaryTextColor,
    size: 100,
  );

  late Icon currentPlayer;
  late bool gameEnd;
  late List<Icon> occupied;

  @override
  void initState() {
    initializeGame();
    super.initState();
  }

  void initializeGame() {
    currentPlayer = player1;
    gameEnd = false;
    occupied = [
      defaultIcon,
      defaultIcon,
      defaultIcon,
      defaultIcon,
      defaultIcon,
      defaultIcon,
      defaultIcon,
      defaultIcon,
      defaultIcon,
    ];
  }

  void changeTurn() {
    if (currentPlayer == player1) {
      currentPlayer = player2;
    } else {
      currentPlayer = player1;
    }
  }

  void showGameOverMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Game over \n $message')),
    );
  }

  void checkForDraw() {
    if (gameEnd) {
      return;
    }
    bool draw = true;
    for (var occupiedPlayer in occupied) {
      if (occupiedPlayer == defaultIcon) {
        draw = false;
      }
    }
    if (draw) {
      showGameOverMessage('Draw');
    }
  }

  void checkForWin() {
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningPos in winningList) {
      Icon playerPosition0 = occupied[winningPos[0]];
      Icon playerPosition1 = occupied[winningPos[1]];
      Icon playerPosition2 = occupied[winningPos[2]];

      if (playerPosition0 != defaultIcon) {
        if (playerPosition0 == playerPosition1 &&
            playerPosition0 == playerPosition2) {
          showGameOverMessage(
              'Player${(playerPosition0 == player1) ? '1' : '2'} won');
          gameEnd = true;
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            initializeGame();
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text('Restart'),
      ),
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(color: primaryTextColor),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff004d40),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  const Text('Player 1',style: TextStyle(
                    color: Colors.black38,
                    fontSize: 20
                  ),),

                 player1,
                  const Text('Player 2',style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20
                  ),),
                 player2,
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {
                      if (gameEnd || occupied[index] != defaultIcon) {
                        return;
                      }
                      setState(() {
                        occupied[index] = currentPlayer;
                        changeTurn();
                        checkForWin();
                        checkForDraw();
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color(0xff004d40),
                      child: occupied[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
