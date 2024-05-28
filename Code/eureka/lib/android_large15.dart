import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

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
  int _currentIndex = 3;
  List<Map<String, dynamic>> students = [];
  List<Map<String, dynamic>> cafes = [];
  bool isLoadingStudents = true;
  bool isLoadingCafes = true;
  List<bool> _expandedStatesStudents = [];
  List<bool> _expandedStatesCafes = [];
  List<List<int>> _ratingsStudents = [];
  List<List<int>> _ratingsCafes = [];
  List<TextEditingController> _commentControllersStudents = [];
  List<TextEditingController> _commentControllersCafes = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
    fetchCafes();
  }

  Future<void> fetchStudents() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.1.6:8080/api/appointments/past?firstStudentId=1'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          students = data.map((student) {
            return {
              'id': student['secondStudentId'], // Correct field name
              'fullname': student['secondStudentFullname'],
              'appointmentDate': student['appointmentDate'],
              'isEvaluatedStudent': student['isEvaluatedStudent'],
              'communication': student['communication'] ?? 1,
              'trueIrl': student['trueIrl'] ?? 1,
              'overall': student['overall'] ?? 1,
            };
          }).toList();

          // Sort students to show non-evaluated first
          students.sort((a, b) => a['isEvaluatedStudent'] ? 1 : -1);

          _expandedStatesStudents = List.filled(students.length, false);
          _ratingsStudents = List.generate(
              students.length,
              (index) => [
                    students[index]['communication'],
                    students[index]['trueIrl'],
                    students[index]['overall'],
                  ]);
          _commentControllersStudents =
              List.generate(students.length, (_) => TextEditingController());
          isLoadingStudents = false;
        });
      } else {
        print('Failed to load students. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> fetchCafes() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.1.6:8080/api/appointments/pastByCafe?firstStudentId=1'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          cafes = data.map((cafe) {
            return {
              'id': cafe['cafeId'], // Correct field name
              'name': cafe['cafeName'],
              'appointmentDate': cafe['appointmentDate'],
              'isEvaluatedStudent': cafe['isEvaluatedStudent'],
              'silence': cafe['silence'] ?? 1,
              'vibe': cafe['vibe'] ?? 1,
              'appointmentEval': cafe['appointmentEval'] ?? 1,
            };
          }).toList();

          // Sort cafes to show non-evaluated first
          cafes.sort((a, b) => a['isEvaluatedStudent'] ? 1 : -1);

          _expandedStatesCafes = List.filled(cafes.length, false);
          _ratingsCafes = List.generate(
              cafes.length,
              (index) => [
                    cafes[index]['silence'],
                    cafes[index]['vibe'],
                    cafes[index]['appointmentEval'],
                  ]);
          _commentControllersCafes =
              List.generate(cafes.length, (_) => TextEditingController());
          isLoadingCafes = false;
        });
      } else {
        print('Failed to load cafes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> submitStudentEvaluation(int index) async {
    if (!validateRatings(_ratingsStudents, index)) {
      showWarningDialog();
      return;
    }

    final url = Uri.parse('http://192.168.1.6:8080/api/evaluateStudents');
    final Map<String, dynamic> payload = {
      'evaluatedPersonId': students[index]
          ['id'], // Provide evaluated person's ID
      'communication': _ratingsStudents[index][0],
      'trueIrl': _ratingsStudents[index][1],
      'overall': _ratingsStudents[index][2],
      'context': _commentControllersStudents[index].text,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print('Evaluation submitted successfully.');
        setState(() {
          students[index]['isEvaluatedStudent'] = true;
          // Re-sort students after submission
          students.sort((a, b) => a['isEvaluatedStudent'] ? 1 : -1);
        });
      } else {
        print(
            'Failed to submit evaluation. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> submitCafeEvaluation(int index) async {
    if (!validateRatings(_ratingsCafes, index)) {
      showWarningDialog();
      return;
    }

    final url = Uri.parse('http://192.168.1.6:8080/api/evaluateCafe');
    final Map<String, dynamic> payload = {
      'evaluatedCafeId': cafes[index]['id'], // Provide evaluated cafe's ID
      'silence': _ratingsCafes[index][0],
      'vibe': _ratingsCafes[index][1],
      'appointmentEval': _ratingsCafes[index][2],
      'context': _commentControllersCafes[index].text,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print('Evaluation submitted successfully.');
        setState(() {
          cafes[index]['isEvaluatedStudent'] = true;
          // Re-sort cafes after submission
          cafes.sort((a, b) => a['isEvaluatedStudent'] ? 1 : -1);
        });
      } else {
        print(
            'Failed to submit evaluation. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  bool validateRatings(List<List<int>> ratings, int index) {
    return ratings[index].every((rating) => rating >= 1);
  }

  void showWarningDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text('Minimum rating is 1'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String formatDateTime(String dateTimeStr) {
    final dateTime = DateTime.parse(dateTimeStr);
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoadingStudents || isLoadingCafes
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/logo_telikoCOLOURED-02.svg',
                      height: 100,
                      width: 150,
                    ),
                  ),
                  ...students.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> student = entry.value;
                    return _buildStudentCard(student, index);
                  }).toList(),
                  ...cafes.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> cafe = entry.value;
                    return _buildCafeCard(cafe, index);
                  }).toList(),
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidLarge15()),
              );
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

  Widget _buildStudentCard(Map<String, dynamic> student, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedStatesStudents[index] = !_expandedStatesStudents[index];
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: _expandedStatesStudents[index]
            ? 525 // Increased expanded height by 18 px
            : 145, // Increased collapsed height by 37 px
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5), // Add space above the photo
            ListTile(
              leading: CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage('assets/images/user1.png'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student['fullname'],
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Appointment date: ${formatDateTime(student['appointmentDate'])}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            if (_expandedStatesStudents[index]) ...[
              _buildRatingRow(
                  'Συνεννόηση', index, 0, student['isEvaluatedStudent']),
              _buildRatingRow(
                  'True IRL', index, 1, student['isEvaluatedStudent']),
              _buildRatingRow(
                  'Συνολικό session', index, 2, student['isEvaluatedStudent']),
              if (!student['isEvaluatedStudent']) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height:
                        100, // Set a specific height for the TextField container
                    child: TextField(
                      controller: _commentControllersStudents[index],
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText: 'Κάποιο έξτρα σχόλιο...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    submitStudentEvaluation(index);
                  },
                  child: Text('Υποβολή'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[900],
                    foregroundColor: Colors.white,
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCafeCard(Map<String, dynamic> cafe, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedStatesCafes[index] = !_expandedStatesCafes[index];
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: _expandedStatesCafes[index]
            ? 525 // Increased expanded height by 18 px
            : 145, // Increased collapsed height by 37 px
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5), // Add space above the photo
            ListTile(
              leading: CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage('assets/images/cafe.png'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cafe['name'],
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Appointment date: ${formatDateTime(cafe['appointmentDate'])}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            if (_expandedStatesCafes[index]) ...[
              _buildRatingRowCafe(
                  'Silence', index, 0, cafe['isEvaluatedStudent']),
              _buildRatingRowCafe('Vibe', index, 1, cafe['isEvaluatedStudent']),
              _buildRatingRowCafe(
                  'Appointment Eval', index, 2, cafe['isEvaluatedStudent']),
              if (!cafe['isEvaluatedStudent']) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height:
                        100, // Set a specific height for the TextField container
                    child: TextField(
                      controller: _commentControllersCafes[index],
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText: 'Κάποιο έξτρα σχόλιο...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    submitCafeEvaluation(index);
                  },
                  child: Text('Υποβολή'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[900],
                    foregroundColor: Colors.white,
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(
      String label, int studentIndex, int ratingIndex, bool isEvaluated) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            children: List.generate(
                3,
                (i) => IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/lamp${_ratingsStudents[studentIndex][ratingIndex] > i ? '_selected' : ''}.svg',
                        color: _ratingsStudents[studentIndex][ratingIndex] > i
                            ? Colors.orange[900]
                            : Colors.grey,
                        width: 30,
                        height: 30,
                      ),
                      onPressed: isEvaluated
                          ? null
                          : () {
                              setState(() {
                                _ratingsStudents[studentIndex][ratingIndex] =
                                    i + 1;
                              });
                            },
                    )),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRowCafe(
      String label, int cafeIndex, int ratingIndex, bool isEvaluated) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            children: List.generate(
                3,
                (i) => IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/lamp${_ratingsCafes[cafeIndex][ratingIndex] > i ? '_selected' : ''}.svg',
                        color: _ratingsCafes[cafeIndex][ratingIndex] > i
                            ? Colors.orange[900]
                            : Colors.grey,
                        width: 30,
                        height: 30,
                      ),
                      onPressed: isEvaluated
                          ? null
                          : () {
                              setState(() {
                                _ratingsCafes[cafeIndex][ratingIndex] = i + 1;
                              });
                            },
                    )),
          ),
        ],
      ),
    );
  }
}
