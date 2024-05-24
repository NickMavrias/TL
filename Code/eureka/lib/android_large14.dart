import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_app_name/android_large13.dart';
import 'package:your_app_name/android_large15.dart';
import 'android_large16.dart';
import 'androidlarge11.dart';
import 'androidlarge11.dart';

class AndroidLarge14 extends StatefulWidget {
  @override
  _AndroidLarge14State createState() => _AndroidLarge14State();
}

class _AndroidLarge14State extends State<AndroidLarge14> {
  int _currentIndex = 1;  // Assuming this screen is the second tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),  // Space from the top
            Center(
              child: SvgPicture.asset(
                'assets/images/logo_telikoCOLOURED-02.svg',
                height: 100,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Αναζήτηση φιλ@',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFFE4572E), width: 3),
                  ),
                ),
              ),
            ),
            UserTile(
              name: 'Νίκος',
              imagePath: 'assets/images/user1.png',
              dateRead: 'Διαβάσατε στις 1/5/505',
              index: 1,
            ),
            UserTile(
              name: 'Γιώργος',
              imagePath: 'assets/images/user2.png',
              dateRead: 'Διαβάσατε στις 29/8/2019',
              index: 2,
            ),
            UserTile(
              name: 'Γιώργος',
              imagePath: 'assets/images/user3.png',
              dateRead: 'Διαβάσατε στις 31/10/2013',
              index: 3,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge11()),
              );
            } else if (index == 1){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge13()),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge14()),
              );
            } else if (index == 3){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge15()));  // Navigate to AndroidLarge15
            } else if (index == 4){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge16()),
              );
            }
          });
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

class UserTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final String dateRead;
  final int index;

  const UserTile({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.dateRead,
    required this.index,
  }) : super(key: key);

  void handleAction(String value) {
    // Example of how to handle actions. Implement according to your needs.
    print('$value User $index');
    // Here you would handle each action.
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 32,
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle: Text(dateRead, style: TextStyle(color: Colors.grey)),
      trailing: PopupMenuButton<String>(
        onSelected: handleAction,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Unmatch',
            child: Text('Unmatch'),
          ),
          const PopupMenuItem<String>(
            value: 'Report',
            child: Text('Report'),
          ),
          const PopupMenuItem<String>(
            value: 'Unfriend',
            child: Text('Unfriend'),
          ),
          const PopupMenuItem<String>(
            value: 'Block',
            child: Text('Block'),
          ),
        ],
      ),
      onTap: () {
        // Implement navigation to chat or detail screen
      },
    );
  }
}
