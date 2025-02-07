import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import '../gameplay/selection.dart';

class RoomScreen extends StatefulWidget {
  final String nickname;
  final String roomCode;

  RoomScreen({super.key, required this.nickname}) : roomCode = _generateRoomCode();

  static String _generateRoomCode() {
    const length = 6;
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
  }

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectionScreen()),
      );
    });
  }

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
        title: StrokeText(
          text: "${widget.nickname}'s Room",
          textStyle: const TextStyle(
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
          strokeColor: const Color.fromARGB(255, 111, 78, 55),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 600,
                height: 500,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 177, 118),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(5, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: const Color(0xFF6F4E37),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const StrokeText(
                              text: 'Kode ruangan:',
                              textStyle: TextStyle(
                                fontFamily: 'Super Ramen',
                                fontSize: 35,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              strokeColor: Colors.black,
                              strokeWidth: 5,
                            ),
                            const SizedBox(height: 10),
                            StrokeText(
                              text: widget.roomCode,
                              textStyle: const TextStyle(
                                fontFamily: 'Super Ramen',
                                fontSize: 60,
                                color: Color.fromARGB(255, 254, 216, 177),
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              strokeColor: Colors.black,
                              strokeWidth: 5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StrokeText(
                              text: widget.nickname,
                              textStyle: const TextStyle(
                                fontFamily: 'Super Ramen',
                                fontSize: 50,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              strokeColor: Colors.black,
                              strokeWidth: 5,
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            const StrokeText(
                              text: 'Player 2',
                              textStyle: TextStyle(
                                fontFamily: 'Super Ramen',
                                fontSize: 50,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              strokeColor: Colors.black,
                              strokeWidth: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Menunggu pemain...',
                style: TextStyle(
                  fontFamily: 'Super Ramen',
                  fontSize: 24,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}