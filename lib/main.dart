import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(Dice());
}

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  bool isGameStarted = false;

  int score = 0;

  final Map<String, int> deckOfDices = {
    "assets/dice/dice1.png": 1,
    "assets/dice/dice2.png": 2,
    "assets/dice/dice3.png": 3,
    "assets/dice/dice4.png": 4,
    "assets/dice/dice5.png": 5,
    "assets/dice/dice6.png": 6,
  };

  String diceOneKey = '';
  String diceTwoKey = '';

  @override
  void initState() {
    super.initState();
  }

  void changeDice() {
    setState(() {
      isGameStarted = true;
    });

    Random random = Random();

    diceOneKey = deckOfDices.keys.elementAt(random.nextInt(deckOfDices.length));
    diceTwoKey = deckOfDices.keys.elementAt(random.nextInt(deckOfDices.length));

    score = deckOfDices[diceOneKey]! + deckOfDices[diceTwoKey]!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[200],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250, bottom: 20),
                  child: Text(
                    "Score: $score",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "IndieFlower",
                    ),
                  ),
                ),
                isGameStarted
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 100,
                                child: Image.asset(diceOneKey),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 100,
                                child: Image.asset(diceTwoKey),
                              )
                            ],
                          ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.deepOrange[800],
                  onPressed: changeDice,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Let`s GO",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "IndieFlower",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
