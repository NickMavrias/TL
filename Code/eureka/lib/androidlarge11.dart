import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class AndroidLarge11 extends StatefulWidget {
  @override
  _AndroidLarge11State createState() => _AndroidLarge11State();
}

class _AndroidLarge11State extends State<AndroidLarge11> {
  List<SwipeItem> swipeItems = [];
  late MatchEngine matchEngine;

  @override
  void initState() {
    super.initState();
    swipeItems = [
      SwipeItem(
        content: Content(
          imagePath: 'assets/images/user1.png',
          name: 'Nick',
          age: 22,
          location: 'Patra',
          distance: 1.0,
        ),
        likeAction: () => print("Liked N"),
        nopeAction: () => print("Disliked N"),
        superlikeAction: () => print("Superliked N"),
      ),
      SwipeItem(
        content: Content(
          imagePath: 'assets/images/user2.png',
          name: 'Georgios',
          age: 22,
          location: 'Patra',
          distance: 3.2,
        ),
        likeAction: () => print("Liked G"),
        nopeAction: () => print("Disliked G"),
        superlikeAction: () => print("Superliked G"),
      ),

    ];
    matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {},
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
        ),
      ],
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(39),
            child: Image.asset(
              content.imagePath,
              fit: BoxFit.cover,
            ),
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
                  Text('Lives in ${content.location}', style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text('${content.distance} km away', style: TextStyle(color: Colors.white, fontSize: 16)),
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