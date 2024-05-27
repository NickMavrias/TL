import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_app_name/android_large_10.dart';

import 'android_large13.dart';
import 'android_large14.dart';
import 'android_large15.dart';
import 'androidlarge11.dart'; // Make sure to add image_picker in your pubspec.yaml

class AndroidLarge16 extends StatefulWidget {
  @override
  _AndroidLarge16State createState() => _AndroidLarge16State();
}

class _AndroidLarge16State extends State<AndroidLarge16> {
  int _currentIndex = 3;
  String selectedSchoolFilter = "Ίδια με εμένα";
  String selectedReadingStyle = "Χωρίς διαλλείματα και ομιλία";
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            _buildProfilePictureSection(),
            SizedBox(height: 20),
            _buildInterestSection(),
            SizedBox(height: 20),
            _buildFilterSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge11()),
              );
            } else if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge13()),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge14()),
              );
            } else if (index == 3) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AndroidLarge15())); // Navigate to AndroidLarge15
            } else if (index == 4) {
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

  Widget _buildProfilePictureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Change Profile Picture',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              6,
              (index) => GestureDetector(
                    onTap: () => _changeProfilePicture(),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/images/profile_placeholder.png'), // Example image
                    ),
                  )),
        ),
      ],
    );
  }

  Widget _buildInterestSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Change Interests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (String interest in [
                'Γυμναστήριο',
                'Netflix',
                'Μαγειρική',
                'Τζόγος',
                'Escape rooms',
                'Κατοικίδια',
                'Brunch',
                'Single malt',
                'Κρασί',
                'DnD',
                'Μπύρα',
                'Βινύλια',
                'Self care',
                'Mindfullness',
                'Burger',
                'Sushi',
                'Fine dining',
                'Pub crawls',
                'Pizza',
                'Outdoors',
                'Πιτόγυρα',
                'Καφές',
                'Επιτραπέζια',
                'Βιβλία',
                'Μουσική',
                'Κλαμπινγκ',
                'Αθλήματα'
              ])
                InterestButton(
                    interest: interest,
                    onTap: () {
                      // Define what happens when an interest button is tapped
                      print('Interest selected: $interest');
                    }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("Filters",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        DropdownButton<String>(
          value: selectedSchoolFilter,
          onChanged: (newValue) {
            setState(() {
              selectedSchoolFilter = newValue!;
            });
          },
          items: ["Ίδια με εμένα", "Ολες"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        DropdownButton<String>(
          value: selectedReadingStyle,
          onChanged: (newValue) {
            setState(() {
              selectedReadingStyle = newValue!;
            });
          },
          items: [
            "Χωρίς διαλλείματα και ομιλία",
            "Με διαλλειματα αλλά χωρίς ομιλία",
            "Με διαλλειματα και με ομιλια"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _changeProfilePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('Image selected: ${pickedFile.path}');
    } else {
      print('No image selected.');
    }
  }
}
