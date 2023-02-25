import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> displayXOrO = ['', '', '', '', '', '', '', '', ''];

  bool turnX = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red,
              Colors.blue,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                _tap(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    displayXOrO[index],
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tap(int index) {
    setState(() {
      if (turnX) {
        displayXOrO[index] = 'X';
      } else {
        displayXOrO[index] = 'O';
      }

      turnX = !turnX;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // row 1
    if (displayXOrO[0] != '' &&
        displayXOrO[0] == displayXOrO[1] &&
        displayXOrO[0] == displayXOrO[2]) {
      _showDialog();
    }

    //row 2
    if (displayXOrO[3] != '' &&
        displayXOrO[3] == displayXOrO[4] &&
        displayXOrO[3] == displayXOrO[5]) {
      _showDialog();
    }

    //row 3
    if (displayXOrO[6] != '' &&
        displayXOrO[6] == displayXOrO[7] &&
        displayXOrO[6] == displayXOrO[8]) {
      _showDialog();
    }

    //column 1
    if (displayXOrO[0] != '' &&
        displayXOrO[0] == displayXOrO[3] &&
        displayXOrO[0] == displayXOrO[6]) {
      _showDialog();
    }

    //column 2
    if (displayXOrO[1] != '' &&
        displayXOrO[1] == displayXOrO[4] &&
        displayXOrO[1] == displayXOrO[7]) {
      _showDialog();
    }

    //column 3
    if (displayXOrO[2] != '' &&
        displayXOrO[2] == displayXOrO[5] &&
        displayXOrO[2] == displayXOrO[8]) {
      _showDialog();
    }

    if (displayXOrO[0] != '' &&
        displayXOrO[0] == displayXOrO[4] &&
        displayXOrO[0] == displayXOrO[8]) {
      _showDialog();
    }

    if (displayXOrO[2] != '' &&
        displayXOrO[2] == displayXOrO[4] &&
        displayXOrO[2] == displayXOrO[6]) {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('winner'),
      ),
    );
  }
}
