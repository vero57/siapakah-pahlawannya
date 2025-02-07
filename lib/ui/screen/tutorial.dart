import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 104, 78),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const StrokeText(
          text: 'Tutorial',
          textStyle: TextStyle(
            fontFamily: 'Super Ramen',
            fontSize: 50,
            color: Color.fromARGB(255, 254, 216, 177),
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          ),
          strokeColor: Color.fromARGB(255, 111, 78, 55),
          strokeWidth: 15,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/icon.png'),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6F4E37),
              Color(0xFFA67B5B),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/tutorial.png',
            width: 1500, // Adjust the width as needed
            height: 1200, // Adjust the height as needed
          ),
        ),
      ),
    );
  }
}