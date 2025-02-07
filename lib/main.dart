import 'package:flutter/material.dart';
import 'package:siapakah_pahlawannya/ui/screen/tutorial.dart';
import 'ui/screen/main_screen.dart';
import 'ui/screen/gameplay/gameplay.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainScreen(),
      // home: TutorialScreen(),
      // home: GameplayScreen(selectedImage: '', selectedName: '',),
    );
  }
}