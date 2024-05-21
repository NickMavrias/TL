import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(home: AndroidLarge15()));
}

class AndroidLarge15 extends StatefulWidget {
  @override
  _AndroidLarge15State createState() => _AndroidLarge15State();
}

class _AndroidLarge15State extends State<AndroidLarge15> {
  int _currentIndex = 3;  // Keep the bottom navigation bar index as is
  bool _isExpanded = false;  // State to manage if the rectangle is expanded
  List<int> _ratings = [0, 0, 0];  // To store the ratings for the three categories

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
                  _isExpanded = !_isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: _isExpanded ? 430 : 100,  // Expand height when clicked
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(46),
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
                      if (_isExpanded) ...[
                        _buildRatingRow('Συνεννόηση', 0),
                        _buildRatingRow('True IRL', 1),
                        _buildRatingRow('Συνολικό session', 2),
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
                          backgroundColor: Colors.orange[900],  // Specify the background color
                          foregroundColor: Colors.white,  // This sets the text color
                          shape: StadiumBorder(),  // Rounded corners shape
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
            // Navigational logic is retained exactly as you defined
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
Widget _buildRatingRow(String label, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Row(
          children: List.generate(3, (i) => IconButton(
            icon: SvgPicture.asset(
              'assets/images/lamp${_ratings[index] > i ? '_selected' : ''}.svg',
              color: _ratings[index] > i ? Colors.orange[900] : Colors.grey,
              width: 30,
              height: 30,
            ),
            onPressed: () {
              setState(() {
                _ratings[index] = i + 1;
              });
            },
          )),
        ),
      ],
    ),
  );
}
}