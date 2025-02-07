import 'package:flutter/material.dart';
import 'package:siapakah_pahlawannya/repositories/image_data.dart';
import 'dart:async';
import 'package:stroke_text/stroke_text.dart';
import 'widget/chat.dart'; 
import 'widget/alert_win.dart';

class GameplayScreen extends StatefulWidget {
  final String selectedImage;
  final String selectedName;

  GameplayScreen({required this.selectedImage, required this.selectedName});

  @override
  _GameplayScreenState createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  int _start = 15;
  Timer? _timer;
  bool _isDeleteMode = false;
  bool _isSelectMode = false;
  List<ImageData> _imageDataList = List.from(imageDataList);
  ImageData? _selectedImageData;

  String get timerText => '$_start';

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void resetTimer() {
    setState(() {
      _start = 15;
    });
    _timer?.cancel();
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _showExitAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Peringatan'),
          content: const Text('Permainan sedang dimulai, tidak bisa keluar'),
          actions: [
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

  void _showConfirmationAlert(BuildContext context, ImageData imageData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin dengan pilihan Anda?'),
        actions: [
          TextButton(
            child: const Text('Tidak'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Ya'),
            onPressed: () {
              // Navigator.of(context).pop();
              // showAlertWin(context, imageData.imagePath, imageData.name);
              Navigator.of(context).pop();
              showAlertLose(context, imageData.imagePath, imageData.name);
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
            _showExitAlert(context);
          },
        ),
        title: const StrokeText(
          text: 'Gameplay',
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 71, 45, 28),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          timerText,
                          style: const TextStyle(
                            fontFamily: 'Beige Come',
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 224, 193),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 150,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 109,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.selectedImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.selectedName,
                            style: const TextStyle(
                              fontFamily: 'Super Ramen',
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSelectMode = true;
                            });
                          },
                          child: Image.asset(
                            'assets/yes.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDeleteMode = !_isDeleteMode;
                            });
                          },
                          child: Image.asset(
                            'assets/no.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 80), 
              Container(
                width: 800,
                height: 700,
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
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 16.0),
                    itemCount: _imageDataList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final imageData = _imageDataList[index];
                      return GestureDetector(
                        onTap: () {
                          if (_isDeleteMode) {
                            setState(() {
                              _imageDataList.removeAt(index);
                            });
                          } else if (_isSelectMode) {
                            _showConfirmationAlert(context, imageData);
                          } else {
                            setState(() {
                              _selectedImageData = imageData;
                            });
                          }
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: _selectedImageData == imageData ? Colors.blue : Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 130,
                                height: 109,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(imageData.imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                imageData.name,
                                style: const TextStyle(
                                  fontFamily: 'Super Ramen',
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 80), // Gap between middle and right container
              // Right container with ChatWidget
              Container(
                width: 250,
                height: 700,
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
                child: ChatWidget(onMessageSent: resetTimer), // Add ChatWidget here
              ),
            ],
          ),
        ),
      ),
    );
  }
}