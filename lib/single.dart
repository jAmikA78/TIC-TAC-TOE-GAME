import 'package:flutter/material.dart';
import 'package:tic_tac_toe/vs_computer.dart';

class single_screen extends StatefulWidget {
  const single_screen({Key? key}) : super(key: key);

  @override
  State<single_screen> createState() => _single_screenState();
}

class _single_screenState extends State<single_screen> {
  final TextEditingController _firstPlayerController = TextEditingController();
  String firstPlayerName = '';

  void _onNextButtonPressed(BuildContext context) {
    setState(() {
      firstPlayerName = _firstPlayerController.text;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => vs_computer(player: firstPlayerName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Single player'),
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
                      labelText: 'player',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                const SizedBox(width: 50, height: 10),
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
