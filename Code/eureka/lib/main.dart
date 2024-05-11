import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'android_large_6.dart'; // Make sure this path matches the location of your AndroidLarge6 file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  int _currentIndex = 0;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentIndex == 6) {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AndroidLarge4()));
      } else {
        setState(() {
          _currentIndex++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          _currentIndex % 2 == 0 ? 'assets/images/logo_telikoCOLOURED-02.svg' : 'assets/images/logo_telikoCOLOURED-02ORANGE-01.svg',
          width: 360,
          height: 800,
        ),
      ),
    );
  }
}

class AndroidLarge4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 800,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/images/logo_telikoCOLOURED-02.svg',
                      width: 150,
                      height: 100,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 377.33,
                    child: Opacity(
                      opacity: 0.77,
                      child: Container(
                        width: 772.01,
                        height: 422.67,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/backmodel.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74.38,
                    top: 694,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AndroidLarge6()),
                        );
                      },
                      child: Container(
                        width: 211,
                        height: 48,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE4572E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Είσοδος',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23.56,
                    top: 138.73,
                    child: Text(
                      'Ταίριαξε',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 64,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23.56,
                    top: 213.73,
                    child: Text(
                      'Βρες',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 64,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23.56,
                    top: 288.73,
                    child: Text(
                      'Διάβασε',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 64,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74.75,
                    top: 623,
                    child: Container(
                      width: 211,
                      height: 48,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFF1E1E1E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Εγγραφή',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 62.02,
                    top: 765,
                    child: Text(
                      'Έχεις μαγαζί?',
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.10,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 168.25,
                    top: 765,
                    child: Text(
                      'Γίνε συνεργάτης τώρα',
                      style: TextStyle(
                        color: Color(0xFFE4572E),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.10,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
