import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'room_screen.dart';

class MakeRoomScreen extends StatelessWidget {
  MakeRoomScreen({super.key});

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController roomCodeController = TextEditingController();

  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        title: const StrokeText(
          text: 'BUAT RUANG',
          textStyle: TextStyle(
            fontFamily: 'Super Ramen',
            fontSize: 50,
            color: Color.fromARGB(255, 254, 216, 177),
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
          child: Container(
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
                    width: 420,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFAA7C55),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: TextField(
                      controller: nicknameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Masukkan Username',
                        hintStyle: TextStyle(
                          fontFamily: 'Super Ramen',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFED8B1),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Super Ramen',
                        fontSize: 20,
                        fontWeight: FontWeight.w300, 
                        color: Color(0xFFFED8B1),
                      ),
                      enableInteractiveSelection: false,
                      showCursor: false,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFAA7C55),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: roomCodeController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Kode ruang',
                            hintStyle: TextStyle(
                              fontFamily: 'Super Ramen',
                              fontSize: 20,
                              fontWeight: FontWeight.w300, 
                              color: Color(0xFFFED8B1),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Super Ramen',
                            fontSize: 20,
                            fontWeight: FontWeight.w300, 
                            color: Color(0xFFFED8B1),
                          ),
                          enableInteractiveSelection: false,
                          showCursor: false,
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (nicknameController.text.isEmpty || roomCodeController.text.isEmpty) {
                            _showAlert(context, 'Masukkan kode ruang.');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoomScreen(
                                  nickname: nicknameController.text,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 71, 45, 28),
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black, width: 2),
                          ),
                          minimumSize: const Size(200, 75), 
                        ),
                        child: const Text(
                          'JOIN',
                          style: TextStyle(
                            fontFamily: 'Super Ramen',
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: Color.fromARGB(255, 254, 216, 177),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (nicknameController.text.isEmpty) {
                        _showAlert(context, 'Username tidak boleh kosong.');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomScreen(
                              nickname: nicknameController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA7C55),
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                      minimumSize: const Size(420, 80), 
                    ),
                    child: const Text(
                      'Buat Ruangan',
                      style: TextStyle(
                        fontFamily: 'Super Ramen',
                        fontSize: 20,
                        fontWeight: FontWeight.w300, 
                        color: Color(0xFFFED8B1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}