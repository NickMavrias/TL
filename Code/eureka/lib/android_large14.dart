import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_app_name/android_large13.dart';
import 'package:your_app_name/android_large15.dart';
import 'package:your_app_name/android_large16.dart';
import 'package:your_app_name/androidlarge11.dart';
import 'package:http/http.dart' as http;

class AndroidLarge14 extends StatefulWidget {
  @override
  _AndroidLarge14State createState() => _AndroidLarge14State();
}

class _AndroidLarge14State extends State<AndroidLarge14> {
  int _currentIndex = 1; // Assuming this screen is the second tab
  List<Map<String, dynamic>> friends = [];
  List<Map<String, dynamic>> filteredFriends = [];
  bool isLoading = true;
  List<String> imagePaths = [
    'assets/images/user1.png',
    'assets/images/user2.png',
    'assets/images/user3.png',
    'assets/images/user4.png',
    'assets/images/user5.png',
    // Add more image paths as needed
  ];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchFriends();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    filterFriends();
  }

  Future<void> fetchFriends() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.1.8:8080/api/students/matched'));

      if (response.statusCode == 200) {
        // Log the response body
        print('Response body: ${response.body}');

        // Decode the response
        List<dynamic> data = json.decode(response.body);

        // Log the decoded data
        print('Decoded data: $data');

        setState(() {
          friends = data.asMap().entries.map((entry) {
            int idx = entry.key;
            var friend = entry.value;
            return {
              'id': friend['id'],
              'fullname': friend['fullname'],
              'imagePath': imagePaths[idx % imagePaths.length],
            };
          }).toList();
          filteredFriends = friends;
          isLoading = false;
        });
      } else {
        // Log the status code and reason
        print('Failed to load friends. Status code: ${response.statusCode}');
        throw Exception('Failed to load friends');
      }
    } catch (e) {
      // Log any exceptions
      print('Exception caught: $e');
      throw Exception('Failed to load friends');
    }
  }

  void filterFriends() {
    List<Map<String, dynamic>> tempFriends = [];
    tempFriends.addAll(friends);
    if (searchController.text.isNotEmpty) {
      tempFriends.retainWhere((friend) {
        String searchTerm = searchController.text.toLowerCase();
        String friendName = friend['fullname'].toLowerCase();
        return friendName.contains(searchTerm);
      });
    }
    setState(() {
      filteredFriends = tempFriends;
    });
  }

  Future<void> unMatchStudent(int id) async {
    final url = Uri.parse('http://192.168.1.8:8080/api/students/$id/unmatch');
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        // Handle successful response if needed
        print('Successfully unmatched student with id $id');
        // Optionally, refresh the friend list or update the UI
        fetchFriends();
      } else {
        // Handle error response if needed
        print('Failed to unmatch student. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }
  }

  Future<void> reportStudent(int reportedPersonId, String context) async {
    final url = Uri.parse('http://192.168.1.8:8080/api/students/report');
    final reportDto =
        ReportDto(reportedPersonId: reportedPersonId, context: context);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(reportDto.toJson()),
      );
      if (response.statusCode == 200) {
        // Handle successful response if needed
        print('Successfully reported student with id $reportedPersonId');
        // Refresh the friend list or update the UI
        fetchFriends();
      } else {
        // Handle error response if needed
        print('Failed to report student. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }
  }

  Future<void> blockStudent(int blockedPersonId) async {
    final url = Uri.parse('http://192.168.1.8:8080/api/students/block');
    final blockDto = BlockDto(blockedPersonId: blockedPersonId);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(blockDto.toJson()),
      );
      if (response.statusCode == 200) {
        // Handle successful response if needed
        print('Successfully blocked student with id $blockedPersonId');
        // Refresh the friend list or update the UI
        fetchFriends();
      } else {
        // Handle error response if needed
        print('Failed to block student. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }
  }

  Future<void> showReportDialog(int reportedPersonId) async {
    TextEditingController reasonController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report User'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please enter the reason for reporting this user:'),
                TextField(
                  controller: reasonController,
                  decoration: InputDecoration(hintText: "Reason"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Report'),
              onPressed: () {
                reportStudent(reportedPersonId, reasonController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40), // Space from the top
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
                controller: searchController,
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
            // Display the friends list dynamically
            isLoading
                ? CircularProgressIndicator()
                : Column(
                    children: filteredFriends.map((friend) {
                      return UserTile(
                        name: friend['fullname'],
                        imagePath: friend['imagePath'],
                        dateRead: 'Διαβάσατε στις 1/5/505', // Placeholder date
                        index: friend['id'],
                        onUnmatch: () => unMatchStudent(friend['id']),
                        onReport: () => showReportDialog(friend['id']),
                        onBlock: () => blockStudent(friend['id']),
                      );
                    }).toList(),
                  ),
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
}

class UserTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final String dateRead;
  final int index;
  final VoidCallback onUnmatch;
  final VoidCallback onReport;
  final VoidCallback onBlock;

  const UserTile({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.dateRead,
    required this.index,
    required this.onUnmatch,
    required this.onReport,
    required this.onBlock,
  }) : super(key: key);

  void handleAction(String value) {
    // Example of how to handle actions. Implement according to your needs.
    print('$value User $index');
    if (value == 'Unmatch') {
      onUnmatch();
    } else if (value == 'Report') {
      onReport();
    } else if (value == 'Block') {
      onBlock();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 32,
      ),
      title: Text(name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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

class ReportDto {
  final int reportedPersonId;
  final String context;

  ReportDto({required this.reportedPersonId, required this.context});

  Map<String, dynamic> toJson() {
    return {
      'reportedPersonId': reportedPersonId,
      'context': context,
    };
  }
}

class BlockDto {
  final int blockedPersonId;

  BlockDto({required this.blockedPersonId});

  Map<String, dynamic> toJson() {
    return {
      'blockedPersonId': blockedPersonId,
    };
  }
}
