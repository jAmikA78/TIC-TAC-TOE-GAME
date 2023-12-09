import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_page_2.dart';

class MultiScreen extends StatefulWidget {
  const MultiScreen({Key? key}) : super(key: key);

  @override
  State<MultiScreen> createState() => _MultiScreenState();
}

class _MultiScreenState extends State<MultiScreen> {
  final TextEditingController _firstPlayerController = TextEditingController();
  final TextEditingController _secondPlayerController = TextEditingController();
  String firstPlayerName = '';
  String secondPlayerName = '';

  void _onNextButtonPressed(BuildContext context) {
    setState(() {
      firstPlayerName = _firstPlayerController.text;
      secondPlayerName = _secondPlayerController.text;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              game_page_2(player1: firstPlayerName, player2: secondPlayerName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi player'),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: _firstPlayerController,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First player',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                const SizedBox(width: 50, height: 10),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: _secondPlayerController,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Second player',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                const SizedBox(width: 50, height: 100),
                ElevatedButton(
                  onPressed: () {
                    _onNextButtonPressed(context);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 40),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}