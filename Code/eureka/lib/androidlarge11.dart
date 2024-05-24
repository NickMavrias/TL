import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import 'android_large13.dart'; // Make sure to import AndroidLarge13
import 'package:swipe_cards/swipe_cards.dart';
import 'dart:async'; // For Timer
import 'dart:ui' as ui; // Import for ImageFilter
import 'android_large14.dart';
import 'android_large15.dart';
import 'android_large16.dart';

class AndroidLarge11 extends StatefulWidget {
  final bool blurBackground;

  AndroidLarge11({this.blurBackground = false});

  @override
  _AndroidLarge11State createState() => _AndroidLarge11State();
}

class _AndroidLarge11State extends State<AndroidLarge11> {
  List<SwipeItem> swipeItems = [];
  late MatchEngine matchEngine;
  int _currentIndex = 0;
  Timer? _pomodoroTimer;
  int _pomodoroRemainingTime = 20 * 60; // 20 minutes in seconds
  Timer? _hydrationTimer;
  int _hydrationRemainingTime = 60 * 60; // 60 minutes in seconds

  @override
  void initState() {
    super.initState();
    swipeItems = [
      SwipeItem(
        content: Content(
          imagePath: 'assets/images/user1.png',
          name: 'Νίκος',
          age: 22,
          location: 'Πάτρα',
          distance: 1.0,
        ),
        likeAction: () => print("Liked N"),
        nopeAction: () => print("Disliked N"),
        superlikeAction: () => print("Superliked N"),
      ),
      SwipeItem(
        content: Content(
          imagePath: 'assets/images/user2.png',
          name: 'Γιώργος',
          age: 22,
          location: 'Πάτρα',
          distance: 3.2,
        ),
        likeAction: () => print("Liked G"),
        nopeAction: () => print("Disliked G"),
        superlikeAction: () => print("Superliked G"),
      ),
      SwipeItem(
        content: Content(
          imagePath: 'assets/images/user3.png',
          name: 'Γιώργος',
          age: 22,
          location: 'Φλώρινα',
          distance: 0.2,
        ),
        likeAction: () => print("Liked G"),
        nopeAction: () => print("Disliked G"),
        superlikeAction: () => print("Superliked G"),
      ),
    ];
    matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  @override
  void dispose() {
    _pomodoroTimer?.cancel();
    _hydrationTimer?.cancel();
    super.dispose();
  }

  void startPomodoroTimer() {
    _pomodoroRemainingTime = 20 * 60; // Reset to 20 minutes
    _pomodoroTimer?.cancel();
    _pomodoroTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_pomodoroRemainingTime > 0) {
        setState(() {
          _pomodoroRemainingTime--;
        });
      } else {
        _pomodoroTimer?.cancel();
      }
    });
  }

  void startHydrationTimer() {
    _hydrationRemainingTime = 60 * 60; // Reset to 60 minutes
    _hydrationTimer?.cancel();
    _hydrationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_hydrationRemainingTime > 0) {
        setState(() {
          _hydrationRemainingTime--;
        });
      } else {
        _hydrationTimer?.cancel();
      }
    });
  }

  String getFormattedTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: SvgPicture.asset(
                  'assets/images/logo_telikoCOLOURED-02.svg',
                  height: 100,
                  width: 150,
                ),
              ),
              Expanded(
                child: SwipeCards(
                  matchEngine: matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    final item = swipeItems[index].content;
                    return UserCard(content: item);
                  },
                  onStackFinished: () => print("Stack Finished"),
                ),
              ),
            ],
          ),
          if (widget.blurBackground) // Conditional blur overlay with Pomodoro and Hydration timer
            Positioned.fill(
              child: GestureDetector(
                onTap: () {}, // Prevents tap through
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'In session',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: startPomodoroTimer,
                            child: Text('Start Pomodoro'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange, // Orange color for the Pomodoro button
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            getFormattedTime(_pomodoroRemainingTime),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: startHydrationTimer,
                            child: Text('Start Hydration Timer'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue, // Light Blue color for the Hydration button
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            getFormattedTime(_hydrationRemainingTime),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AndroidLarge11()),
            );
          }
          else if (index == 1) { // If second icon is tapped
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AndroidLarge13()),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AndroidLarge14()),
            );
          }
          else if (index == 3){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge15()));  // Navigate to AndroidLarge15
            }
            else if (index == 4){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AndroidLarge16()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/iconM1.png', width: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/iconM2.png', width: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/iconM3.png', width: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/iconM4.png', width: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/iconM5.png', width: 24),
            label: '',
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final Content content;

  UserCard({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 598,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(41),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 4,
            blurRadius: 10,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(39),
              child: Image.asset(content.imagePath, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 191.54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0x60616161), Color(0xFF0A0A0A)],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${content.name}, ${content.age}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('Ζει στην ${content.location}', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text('${content.distance} km μακριά', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/dislik.png'),
                          onPressed: () => print("Disliked"),
                        ),
                        IconButton(
                          icon: Image.asset('assets/images/lik.png'),
                          onPressed: () => print("Liked"),
                        ),
                        IconButton(
                          icon: Image.asset('assets/images/slik.png'),
                          onPressed: () => print("Superliked"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Content {
  final String imagePath;
  final String name;
  final int age;
  final String location;
  final double distance;

  Content({required this.imagePath, required this.name, required this.age, required this.location, required this.distance});
}
