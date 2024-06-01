
import 'package:admin/rep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chat_screen.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
      
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/logo_telikoCOLOURED-02.svg',
                  width: MediaQuery.of(context).size.width * 0.6, // Scales the image according to screen width
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChatScreen(),
            ));
          },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Μηνύματα'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RepScreen(),
            ));
          },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Ριπορτ-μπλοκ'),
                ),
                const SizedBox(height: 70),
                const Text(
                  'Προβολή διαχειριστή',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,  // Ensures visibility if needed
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
