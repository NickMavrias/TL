import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:your_app_name/androidlarge11.dart';
import 'android_large15.dart';
import 'android_large16.dart';
import 'androidlarge11.dart';
import 'android_large14.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

// Student model class
class Student {
  final int id;
  final String fullname;
  final int age;

  Student({required this.id, required this.fullname, required this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      fullname: json['fullname'],
      age: json['age'],
    );
  }
}

// Main widget of the application
class AndroidLarge13 extends StatefulWidget {
  @override
  _AndroidLarge13State createState() => _AndroidLarge13State();
}

// State class for AndroidLarge13
class _AndroidLarge13State extends State<AndroidLarge13> {
  int _currentIndex = 0;
  Future<List<Student>>? futureStudents;

  @override
  void initState() {
    super.initState();
    futureStudents = fetchMatchedStudents();
  }

  Future<List<Student>> fetchMatchedStudents() async {
    final response = await http
        .get(Uri.parse('http://192.168.11.138:8080/api/students/matched'));

    if (response.statusCode == 200) {
      List<dynamic> studentsJson = jsonDecode(response.body);
      return studentsJson.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<void> handleAction(String value, int studentId) async {
    final String apiUrl = 'http://192.168.11.138:8080/api/students';

    if (value == 'Unmatch') {
      final response = await http.post(Uri.parse('$apiUrl/$studentId/unmatch'));
      if (response.statusCode == 200) {
        print('Unmatched Student $studentId');
        setState(() {
          futureStudents = fetchMatchedStudents();
        });
      } else {
        throw Exception('Failed to unmatch student');
      }
    } else if (value == 'Report') {
      final response = await http.post(
        Uri.parse('$apiUrl/report'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'studentId': studentId, 'reason': 'Inappropriate behavior'}),
      );
      if (response.statusCode == 200) {
        print('Reported Student $studentId');
        setState(() {
          futureStudents = fetchMatchedStudents();
        });
      } else {
        throw Exception('Failed to report student');
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AndroidLarge11()));
    } else if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AndroidLarge13()));
    } else if (index == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AndroidLarge14()));
    } else if (index == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AndroidLarge15()));
    } else if (index == 4) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AndroidLarge16()));
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
            child: FutureBuilder<List<Student>>(
              future: futureStudents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Student student = snapshot.data![index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/user_placeholder.png'),
                        ),
                        title: Text(student.fullname),
                        subtitle: Text('Age: ${student.age}'),
                        trailing: PopupMenuButton<String>(
                          onSelected: (String result) {
                            handleAction(result, student.id);
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Unmatch',
                              child: Text('Unmatch'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Report',
                              child: Text('Αναφορά'),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  ChatScreen(name: student.fullname),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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

class ChatScreen extends StatefulWidget {
  final String name;

  ChatScreen({required this.name});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  late StompClient stompClient;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: 'http://192.168.11.138:8080/ws',
        onConnect: _onConnect,
        onWebSocketError: (dynamic error) => print(error.toString()),
      ),
    );
    stompClient.activate();
    _fetchChatMessages();
    _timer = Timer.periodic(
        Duration(milliseconds: 500), (Timer t) => _fetchChatMessages());
  }

  void _onConnect(StompFrame frame) {
    stompClient.subscribe(
      destination: '/topic/public',
      callback: (StompFrame frame) {
        setState(() {
          messages.add({'sender': 'other', 'content': frame.body!});
        });
      },
    );

    // Send a connection message when connected
    stompClient.send(
      destination: '/app/chat.addUser',
      body: jsonEncode({
        'sender': 'johndoe', // Replace with dynamic user if needed
        'content': 'User johndoe has joined the chat',
        'type': 'JOIN',
      }),
    );
  }

  void _fetchChatMessages() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.11.138:8080/api/chat/messages'));

      if (response.statusCode == 200) {
        List<dynamic> messagesJson = jsonDecode(response.body);
        setState(() {
          messages.clear();
          messages.addAll(messagesJson
              .map((json) => {
                    'sender': json['sender'].toString(),
                    'content': json['content'].toString()
                  })
              .toList());
        });
      } else {
        throw Exception(
            'Failed to load messages. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
    }
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      stompClient.send(
        destination: '/app/chat.sendMessage',
        body: jsonEncode({
          'sender': 'johndoe', // Replace with dynamic user if needed
          'content': _controller.text,
          'type': 'CHAT',
        }),
      );
      setState(() {
        messages.add({'sender': 'johndoe', 'content': _controller.text});
      });
      _controller.clear();
    }
  }

  @override
  void dispose() {
    stompClient.deactivate();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Συνομιλία με ${widget.name}'),
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
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['sender'] == 'johndoe';
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.orange[900] : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['content']!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Γράψτε ένα μήνυμα..',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
                IconButton(
                  icon: Icon(Icons.blur_on),
                  onPressed: () => _showPreBlurDialog(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPreBlurDialog() async {
    final List<String> shops = ['Tag', 'Mosaic', 'Poirot'];
    String? selectedShop = shops[0];
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    ThemeData orangeTheme = ThemeData(
      primaryColor: Colors.orange[900], // Using the orange 900 shade
      colorScheme: ColorScheme.light(
        primary: Colors.orange[900]!,
        onPrimary: Colors.white, // Text color on the primary color
        onSurface: Colors.black, // Text color on background/surface
      ),
      dialogBackgroundColor: Colors.white,
    );

    await showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: orangeTheme,
          child: AlertDialog(
            title: Text("Προγραμματισμός ραντεβού"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Επιλέξτε μαγαζί:"),
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
                  Text("Επιλέξτε ημερομηνία:"),
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
                  Text("Επιλέξτε ώρα:"),
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
                child: Text("Πρόσκληση"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _showLoadingScreen(context); // Show loading indicator
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLoadingScreen(BuildContext dialogContext) {
    showDialog(
      context: dialogContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 30),
                Text("Περιμένουμε επιβεβαίωση \n από το καφέ και το εύρημα.."),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 5), () {
      if (Navigator.of(context).canPop()) Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AndroidLarge11(blurBackground: true),
        ),
      );
    });
  }
}

void main() => runApp(MaterialApp(home: AndroidLarge13()));
