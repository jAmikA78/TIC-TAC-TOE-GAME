import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/draw.dart';
import 'package:tic_tac_toe/winner.dart';

class vs_computer extends StatefulWidget {
  final String player;

  vs_computer({Key? key, required this.player}) : super(key: key);

  @override
  State<vs_computer> createState() => _vs_computerState();
}

bool win = false;
List<String> chars = List.filled(9, ' ');
List<Color> colors_ = List.filled(9, Colors.blue);
List<bool> visited = List.filled(9, false);
late String player;
int cnt = 0;

class _vs_computerState extends State<vs_computer> {
  @override
  Widget build(BuildContext context) {
    print("Reb[ilded");
    player = widget.player;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('tic tac toe'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(162, 3, 113, 82),
                Color.fromARGB(161, 86, 191, 236),
                Color.fromARGB(255, 107, 43, 186),
              ],
              stops: [
                0.3,
                0.4,
                0.8,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.player,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    '  VS  ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    'Computer',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[0]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 0);
                        setState(() {});
                      },
                      child: Text(
                        chars[0],
                        style: TextStyle(fontSize: 50),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[1]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 1);
                        setState(() {});
                      },
                      child: Text(
                        chars[1],
                        style: TextStyle(fontSize: 50),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[2]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 2);
                        setState(() {});
                      },
                      child: Text(
                        chars[2],
                        style: TextStyle(fontSize: 50),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[3]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 3);
                        setState(() {});
                      },
                      child: Text(
                        chars[3],
                        style: TextStyle(fontSize: 50),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[4]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 4);
                        setState(() {});
                      },
                      child: Text(
                        chars[4],
                        style: TextStyle(fontSize: 50),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[5]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 5);
                        setState(() {});
                      },
                      child: Text(
                        chars[5],
                        style: TextStyle(fontSize: 50),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[6]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 6);
                        setState(() {});
                      },
                      child: Text(
                        chars[6],
                        style: TextStyle(fontSize: 50),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[7]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 7);
                        setState(() {});
                      },
                      child: Text(
                        chars[7],
                        style: TextStyle(fontSize: 50),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colors_[8]),
                        minimumSize: MaterialStateProperty.all(Size(75, 75)),
                      ),
                      onPressed: () {
                        chk(context, 8);
                        setState(() {});
                      },
                      child: Text(
                        chars[8],
                        style: TextStyle(fontSize: 50),
                      )),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    cnt = 0;
                    chars = List.filled(9, ' ');
                    colors_ = List.filled(9, Colors.blue);
                    visited = List.filled(9, false);
                    win = false;
                    setState(() {});
                  },
                  child: Text(
                    'reset',
                    style: TextStyle(fontSize: 40),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> chk(BuildContext context, int idx) async {
  if (visited[idx]||win) {
    return;
  }
  visited[idx] = true;
  if (cnt & 1 == 1) {
    chars[idx] = 'X';
    colors_[idx] = Colors.cyanAccent;
  } else {
    chars[idx] = 'O';
    colors_[idx] = Colors.pinkAccent;
  }
  cnt++;
  who_win(context);
  if (win) {
    return;
  }
  if (cnt == 9) {
    win = true;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DrawScreen()),
    );
  }
  if (win) {
    return;
  }
  await computer(context);
  cnt++;
  who_win(context);
  if (win) {
    return;
  }
  if (cnt == 9) {
    win = true;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DrawScreen()),
    );
  }
}

Future<void> computer(BuildContext context) async {
  List<int> freeIndices = [];
  for (int i = 0; i < 9; i++) {
    if (!visited[i]) {
      freeIndices.add(i);
    }
  }
  if (freeIndices.isEmpty) {
    return;
  }
  Random random = Random();
  int idx = freeIndices[random.nextInt(freeIndices.length)];
  chars[idx] = 'X';
  colors_[idx] = Colors.cyanAccent;
  visited[idx] = true;
}

void who_win(BuildContext context) {
  String winner = ' ';
  for (int i = 0; i < 9; i += 3) {
    if (chars[i] != ' ' &&
        chars[i] == chars[i + 1] &&
        chars[i] == chars[i + 2]) {
      colors_[i] = Colors.deepPurple;
      colors_[i + 1] = Colors.deepPurple;
      colors_[i + 2] = Colors.deepPurple;
      if (chars[i] == 'X')
        winner = 'X';
      else
        winner = 'O';
      break;
    }
  }

  for (int i = 0; i < 3; i++) {
    if (chars[i] != ' ' &&
        chars[i] == chars[i + 3] &&
        chars[i] == chars[i + 6]) {
      colors_[i] = Colors.deepPurple;
      colors_[i + 3] = Colors.deepPurple;
      colors_[i + 6] = Colors.deepPurple;
      if (chars[i] == 'X')
        winner = 'X';
      else
        winner = 'O';
      break;
    }
  }

  if (chars[0] != ' ' && chars[0] == chars[4] && chars[0] == chars[8]) {
    colors_[0] = Colors.deepPurple;
    colors_[4] = Colors.deepPurple;
    colors_[8] = Colors.deepPurple;
    if (chars[0] == 'X')
      winner = 'X';
    else
      winner = 'O';
  }

  if (chars[2] != ' ' && chars[2] == chars[4] && chars[2] == chars[6]) {
    colors_[2] = Colors.deepPurple;
    colors_[4] = Colors.deepPurple;
    colors_[6] = Colors.deepPurple;
    if (chars[2] == 'X')
      winner = 'X';
    else
      winner = 'O';
  }
  if (winner == 'X')
    winner = 'Computer';
  else if (winner == 'O') winner = player;
  if (winner != ' ') {
    win = true;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WinnerScreen(winner: winner),
      ),
    );
  }
}
