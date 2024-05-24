import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_app_name/android_large16.dart';
import 'android_large13.dart';
import 'android_large14.dart';
import 'androidlarge11.dart';

void main() {
  runApp(MaterialApp(home: AndroidLarge15()));
}

class AndroidLarge15 extends StatefulWidget {
  @override
  _AndroidLarge15State createState() => _AndroidLarge15State();
}

class _AndroidLarge15State extends State<AndroidLarge15> {
  int _currentIndex = 3;  // Keep the bottom navigation bar index as is
  bool _personExpanded = false;  // State to manage if the person section is expanded
  bool _cafeExpanded = false;  // State to manage if the café section is expanded
  List<int> _personRatings = [0, 0, 0];  // To store the ratings for the three person categories
  List<int> _cafeRatings = [0, 0, 0];  // To store the ratings for the three café categories

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
            GestureDetector(
              onTap: () {
                setState(() {
                  _personExpanded = !_personExpanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: _personExpanded ? 450 : 100,  // Expand height when clicked
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 34,
                          backgroundImage: AssetImage('assets/images/user1.png'),
                        ),
                        title: Text(
                          'Νικόλας',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Διαβάσατε στις 5/6/2020',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      if (_personExpanded) ...[
                        _buildRatingRow('Συνεννόηση', 0, _personRatings),
                        _buildRatingRow('True IRL', 1, _personRatings),
                        _buildRatingRow('Συνολικό session', 2, _personRatings),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Κάποιο έξτρα σχόλιο...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Υποβολή'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[900],
                            foregroundColor: Colors.white,
                            shape: StadiumBorder(),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _cafeExpanded = !_cafeExpanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: _cafeExpanded ? 450 : 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 34,
                          backgroundImage: AssetImage('assets/images/tag.png'),
                        ),
                        title: Text(
                          'Tag',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Πήγατε στις 6/5/2020',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      if (_cafeExpanded) ...[
                        _buildRatingRow('Ησυχία', 0, _cafeRatings),
                        _buildRatingRow('Βάιμπ', 1, _cafeRatings),
                        _buildRatingRow('Τήρηση ραντεβού', 2, _cafeRatings),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Κάποιο έξτρα σχόλιο..',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Υποβολή'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[900],
                            foregroundColor: Colors.white,
                            shape: StadiumBorder(),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
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
              Navigator.of(context). push(
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
                MaterialPageRoute(builder: (context) => AndroidLarge16()));
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

  Widget _buildRatingRow(String label, int index, List<int> ratings) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            children: List.generate(3, (i) => IconButton(
              icon: SvgPicture.asset(
                'assets/images/lamp${ratings[index] > i ? '_selected' : ''}.svg',
                color: ratings[index] > i ? Colors.orange[900] : Colors.grey,
                width: 30,
                height: 30,
              ),
              onPressed: () {
                setState(() {
                  ratings[index] = i + 1;
                });
              },
            )),
          ),
        ],
      ),
    );
  }
}
