import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceGamePage extends StatefulWidget {
  const DiceGamePage({Key? key}) : super(key: key);

  @override
  _DiceGamePageState createState() => _DiceGamePageState();
}

class _DiceGamePageState extends State<DiceGamePage> {
  final random = Random.secure();
  int score = 0;
  int highestScore = 0;
  int diceSum = 0;
  bool isGameOver = false;
  int lastScore = 0;
  String display = 'Your score is ';

  final diceList = [
    'pictures/d1.png',
    'pictures/d2.png',
    'pictures/d3.png',
    'pictures/d4.png',
    'pictures/d5.png',
    'pictures/d6.png',
  ];
  int index1 = 0;
  int index2 = 0;
  int index3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Highest Score: $highestScore ',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          Text(
            'Total Score: $score ',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                diceList[index1],
                height: 100,
                width: 100,
              ),
              Image.asset(
                diceList[index2],
                height: 100,
                width: 100,
              ),
              Image.asset(
                diceList[index3],
                height: 100,
                width: 100,
              ),
            ],
          ),
          Text(
            ' Current Score: $diceSum ',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          if (isGameOver)
            Text(
              'GAME OVER!! ',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold),
            ),
          if (isGameOver)
            Text(
              '$display $lastScore',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
          if (!isGameOver)
            SizedBox(
              height: 60,
              width: 100,
              child: ElevatedButton(
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _rollTheDice,
              ),
            ),
          if (isGameOver)
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                child: Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _showStartButton,
              ),
            ),
          Text(
            //sdf hjk shdfjlk adfk hadfjk haskldf h
            'Note: If Current Score = 15, then Game is over!',
            style: TextStyle(
                fontSize: 15, color: Colors.teal, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  void _rollTheDice() {
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      index3 = random.nextInt(6);
      diceSum = index1 + index2 + index3 + 3;
      lastScore = score;

      if (diceSum == 15) {
        isGameOver = true;
        score = 0;
        diceSum = 0;
      } else {
        score += diceSum;
        isGameOver = false;
      }
      if (score > highestScore) {
        highestScore = score;
      }
    });
    print('index1= $index1 index2= $index2 index3=$index3');
  }

  void _showStartButton() {
    setState(() {
      isGameOver = false;
    });
  }
}
