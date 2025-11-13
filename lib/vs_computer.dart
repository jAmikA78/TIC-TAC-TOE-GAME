import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/draw.dart';
import 'package:tic_tac_toe/winner.dart';

class VsComputer extends StatefulWidget {
  final String player;

  const VsComputer({Key? key, required this.player}) : super(key: key);

  @override
  State<VsComputer> createState() => _VsComputerState();
}

class _VsComputerState extends State<VsComputer> {
  static const int gridSize = 9;
  late List<String> board;
  late List<Color> tileColors;
  late List<bool> visited;
  bool gameWon = false;
  int moveCount = 0;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    board = List.filled(gridSize, ' ');
    tileColors = List.filled(gridSize, Colors.blue);
    visited = List.filled(gridSize, false);
    gameWon = false;
    moveCount = 0;
  }

  void _handleTap(int index) async {
    if (visited[index] || gameWon) return;

    _markMove(index, 'O', Colors.pinkAccent);

    if (_checkWinner()) return;
    if (moveCount == gridSize) {
      _showDrawScreen();
      return;
    }

    await _computerMove();

    if (_checkWinner()) return;
    if (moveCount == gridSize) {
      _showDrawScreen();
    }
  }

  void _markMove(int index, String player, Color color) {
    setState(() {
      board[index] = player;
      tileColors[index] = color;
      visited[index] = true;
      moveCount++;
    });
  }

  bool _checkWinner() {
    String? winner = _getWinner();
    if (winner != null) {
      setState(() {
        gameWon = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WinnerScreen(winner: winner)),
      );
      return true;
    }
    return false;
  }

  Future<void> _computerMove() async {
    int bestScore = -1000;
    int bestMove = -1;

    for (int i = 0; i < gridSize; i++) {
      if (!visited[i]) {
        board[i] = 'X';
        visited[i] = true;
        int score = _minimax(0, false);
        board[i] = ' ';
        visited[i] = false;

        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (bestMove != -1) {
      _markMove(bestMove, 'X', Colors.cyanAccent);
    }
  }

  int _minimax(int depth, bool isMaximizing) {
    String? result = _getWinner();
    if (result != null) {
      if (result == 'X') return 10 - depth;
      if (result == 'O') return depth - 10;
      return 0; // Draw
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < gridSize; i++) {
        if (!visited[i]) {
          board[i] = 'X';
          visited[i] = true;
          int score = _minimax(depth + 1, false);
          board[i] = ' ';
          visited[i] = false;
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < gridSize; i++) {
        if (!visited[i]) {
          board[i] = 'O';
          visited[i] = true;
          int score = _minimax(depth + 1, true);
          board[i] = ' ';
          visited[i] = false;
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  String? _getWinner() {
    const List<List<int>> winningPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var positions in winningPositions) {
      if (board[positions[0]] != ' ' &&
          board[positions[0]] == board[positions[1]] &&
          board[positions[1]] == board[positions[2]]) {
        setState(() {
          for (var pos in positions) {
            tileColors[pos] = Colors.deepPurple;
          }
        });
        return board[positions[0]];
      }
    }
    return null;
  }

  void _showDrawScreen() {
    setState(() {
      gameWon = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DrawScreen()),
    );
  }

  Widget _buildGridButton(int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: tileColors[index],
        minimumSize: const Size(75, 75),
      ),
      onPressed: () => _handleTap(index),
      child: Text(
        board[index],
        style: const TextStyle(fontSize: 50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(162, 3, 113, 82),
                Color.fromARGB(161, 86, 191, 236),
                Color.fromARGB(255, 107, 43, 186),
              ],
              stops: [0.3, 0.4, 0.8],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(height: 50),
              _buildBoard(),
              const SizedBox(height: 100),
              _buildResetButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.player,
          style: const TextStyle(fontSize: 30, color: Colors.indigo),
        ),
        const Text(
          '  VS  ',
          style: TextStyle(fontSize: 30, color: Colors.indigo),
        ),
        const Text(
          'Computer',
          style: TextStyle(fontSize: 30, color: Colors.indigo),
        ),
      ],
    );
  }

  Widget _buildBoard() {
    return Column(
      children: List.generate(3, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (col) {
            int index = row * 3 + col;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: _buildGridButton(index),
            );
          }),
        );
      }),
    );
  }

  Widget _buildResetButton() {
    return ElevatedButton(
      onPressed: () {
        setState(_resetGame);
      },
      child: const Text(
        'Reset',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
