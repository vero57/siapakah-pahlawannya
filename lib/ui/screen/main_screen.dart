import 'package:flutter/material.dart';
import 'package:siapakah_pahlawannya/ui/screen/tutorial.dart';
import 'package:stroke_text/stroke_text.dart';
import 'room/makeroom.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6F4E37), // Warna lebih gelap di atas
              Color(0xFFA67B5B), // Warna lebih terang di bawah
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 800,
                height: 300,
                child: Image.asset(
                  'assets/logo-main.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 650, // Atur lebar tombol "Mainkan"
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MakeRoomScreen()),
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 236, 177, 118), // Warna tombol
                    shadowColor: Colors.black, // Warna bayangan tombol
                    elevation: 10, // Tinggi bayangan tombol
                  ),
                  child: const StrokeText(
                    text: "MAINKAN",
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontFamily: "Super Ramen",
                      color: Color.fromARGB(255, 111, 78, 55),
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(128, 0, 0, 0),
                        ),
                      ],
                    ),
                    strokeColor: Color.fromARGB(255, 254, 216, 177),
                    strokeWidth: 10,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 650, // Atur lebar tombol "Tombol Baru"
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TutorialScreen()),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 236, 177, 118), // Warna tombol
                    shadowColor: Colors.black, // Warna bayangan tombol
                    elevation: 10, // Tinggi bayangan tombol
                  ),
                  child: const StrokeText(
                    text: "CARA BERMAIN",
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontFamily: "Super Ramen",
                      color: Color.fromARGB(255, 111, 78, 55),
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(128, 0, 0, 0),
                        ),
                      ],
                    ),
                    strokeColor: Color.fromARGB(255, 254, 216, 177),
                    strokeWidth: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}