import 'package:flutter/material.dart';

class Dashbord extends StatefulWidget {
  @override
  _DashbordState createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  String player1 = 'X';
  String player2 = 'O';
  String? current = 'X';
  List<String?> board = List.filled(9, null);

  void play(int index) {
    if (board[index] == null) {
      setState(() {
        board[index] = current;
        current = (current == player1) ? player2 : player1;
      });
    }
  }

  void reset() {
    setState(() {
      board = List.filled(9, null);
      current = player1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(9, (index) {
                return GestureDetector(
                  onTap: () => play(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      // border: Border.all(width: 2.0, color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        board[index] ?? '',
                        style: TextStyle(fontSize: 64, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          MaterialButton(
            onPressed: reset,
            child: Text("Reset"),
            color: Colors.blueAccent,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}