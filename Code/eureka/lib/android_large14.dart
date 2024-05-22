//epafes
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_app_name/android_large13.dart';
import 'package:your_app_name/android_large15.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 40),
          child: SvgPicture.asset(
            'assets/images/logo_telikoCOLOURED-02.svg',
            height: 100,
            width: 150,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
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
          ),
          UserTile(
            name: 'Γιώργος',
            imagePath: 'assets/images/user2.png',
            dateRead: 'Διαβάσατε στις 29/8/2019',
          ),
          UserTile(
            name: 'Γιώργος',
            imagePath: 'assets/images/user3.png',
            dateRead: 'Διαβάσατε στις 31/10/2013',
          ),
          
        ],
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
          }
          else if (index == 1){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AndroidLarge13()),
            );
          }
          else if (index == 3){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge15()));  // Navigate to AndroidLarge15
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

  const UserTile({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.dateRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 32,
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle: Text(dateRead, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.message, color: Color(0xFFE4572E)),
      onTap: () {
        // Implement navigation to chat or detail screen
      },
    );
  }
}
