import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WinnerScreen extends StatefulWidget {
  final String winner;

  const WinnerScreen({Key? key, required this.winner}) : super(key: key);

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Winner'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 107, 43, 186),
                Color.fromARGB(162, 3, 113, 82),
                Color.fromARGB(161, 86, 191, 236),
              ],
              stops: [
                0.1,
                0.5,
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
                Text(
                  '${widget.winner} wins!',
                  style: TextStyle(fontSize: 50),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Play Again',
                    style: TextStyle(fontSize: 30),
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
