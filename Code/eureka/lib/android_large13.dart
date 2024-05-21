import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'androidlarge11.dart';
import 'android_large14.dart';

class AndroidLarge13 extends StatefulWidget {
  @override
  _AndroidLarge13State createState() => _AndroidLarge13State();
}

class _AndroidLarge13State extends State<AndroidLarge13> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AndroidLarge14()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/logo_telikoCOLOURED-02.svg',
                height: 100,
                width: 150,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user${index + 1}.png'),
                  ),
                  title: Text('User $index'),
                  subtitle: Text('Tap to chat'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(name: 'User $index'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
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

class ChatScreen extends StatelessWidget {
  final String name;

  ChatScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    final List<String> shops = ['Shop 1', 'Shop 2', 'Shop 3']; // Example shops

    Future<void> _showPreBlurDialog() async {
      String? selectedShop = shops[0];
      DateTime selectedDate = DateTime.now();
      TimeOfDay selectedTime = TimeOfDay.now();
      await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text("Schedule Rendezvous"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("Select Shop:"),
                      DropdownButton<String>(
                        value: selectedShop,
                        onChanged: (value) {
                          setState(() {
                            selectedShop = value;
                          });
                        },
                        items: shops.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Text("Select Date:"),
                      ListTile(
                        title: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
                        trailing: Icon(Icons.calendar_today),
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Text("Select Time:"),
                      ListTile(
                        title: Text(selectedTime.format(context)),
                        trailing: Icon(Icons.access_time),
                        onTap: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                          );
                          if (pickedTime != null) {
                            setState(() {
                              selectedTime = pickedTime;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("Invite"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AndroidLarge11(blurBackground: true)),
                      );
                    },
                  ),
                ],
              );
            }
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $name'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/logo_telikoCOLOURED-02.svg',
                height: 100,
                width: 150,
              ),
            ),
          ),
          Expanded(
            child: Container(
              // Implement chat messages list view here
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle send message
                  },
                ),
                IconButton(
                  icon: Icon(Icons.blur_on), // Use this icon to trigger the settings
                  onPressed: _showPreBlurDialog,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
