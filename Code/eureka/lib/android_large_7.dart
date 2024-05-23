import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AndroidLarge7 extends StatelessWidget {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String name;
  final String birthday;
  final String gender;
  final bool newsletter;
  final String bio;
  final List<String> interests;
  final List<File> photos;

  AndroidLarge7({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.newsletter,
    required this.bio,
    required this.interests,
    required this.photos,
  });

  Future<List<String>> _convertPhotosToBase64(List<File> photos) async {
    List<String> base64Photos = [];
    for (var photo in photos) {
      final bytes = await photo.readAsBytes();
      base64Photos.add(base64Encode(bytes));
    }
    return base64Photos;
  }

  Future<void> _submitData(BuildContext context) async {
    final base64Photos = await _convertPhotosToBase64(photos);
    final images = base64Photos.map((photo) => {'imageData': photo}).toList();

    final data = {
      'email': email,
      'phone': phone,
      'fullname': name,
      'birthday': birthday,
      'gender': gender.toUpperCase(),
      'wantEmail': newsletter,
      'bio': bio,
      'interests': interests.join(', '),
      'role': 'STUDENT',
      'user': {
        'username': username,
        'password': password,
        'role': 'STUDENT',
      },
      'images': images,
    };

    final response = await http.post(
      Uri.parse('http://192.168.2.3:8080/api/students'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Registration successful!'),
        duration: Duration(seconds: 2),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${response.statusCode} - ${response.body}'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: FutureBuilder<List<String>>(
        future: _convertPhotosToBase64(photos),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final base64Photos = snapshot.data!;
            return ListView(
              children: [
                Container(
                  width: 360,
                  height: 800,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 21.78,
                        top: 81.25,
                        child: SizedBox(
                          width: 316.44,
                          height: 82.09,
                          child: Text(
                            'Καλως ήρθατε στο Eureka',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 40,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                              height: 1,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38.92,
                        top: 172.16,
                        child: SizedBox(
                          width: 282.17,
                          height: 37,
                          child: Text(
                            'Παρακαλούμε να ακολουθείτε\nτους εξής κανόνες',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              height: 1.2,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      _buildBulbText(context, 'Να είστε εσείς', 243.56),
                      _buildBulbText(context, 'Μείνετε ασφαλείς', 358.94),
                      _buildBulbText(context, 'Προληπτική δράση', 482.15),
                      Positioned(
                        left: 73.14,
                        top: 276.21,
                        child: SizedBox(
                          width: 273.33,
                          height: 43.97,
                          child: Text(
                            'Οι φωτογραφίες, ηλικία και γενικότερη όψη αντιπροσωπευτική της πραγματικότητας',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              height: 1.3,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 73.14,
                        top: 387.39,
                        child: SizedBox(
                          width: 268.83,
                          height: 56,
                          child: Text(
                            'Μην βιαστείτε να δώσετε προσωπικές πληροφορίες και διαβάστε το eureka101',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              height: 1.3,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 76.02,
                        top: 510.60,
                        child: SizedBox(
                          width: 268.83,
                          height: 44.35,
                          child: Text(
                            'Κάντε αναφορά στο παραμικρό ίχνος\nκακής συμπεριφοράς',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              height: 1.3,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 97.50,
                        top: 645.92,
                        child: Container(
                          width: 165,
                          height: 154.08,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: SvgPicture.asset(
                            'assets/images/logo_telikoCOLOURED-02.svg',
                            width: 150,
                            height: 100,
                          ), // Replace with your logo
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 594.92,
                        child: Container(
                          width: 310,
                          height: 51,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFE4572E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () => _submitData(context),
                              child: Text(
                                'Παμ!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  letterSpacing: 0.10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 660,
                        child: Container(
                          width: 310,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: base64Photos.map((base64Photo) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3, color: Color(0xFF1E1E1E)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.memory(
                                  base64Decode(base64Photo),
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildBulbText(BuildContext context, String text, double top) {
    return Positioned(
      left: 40,
      top: top,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bulbEUR.png', width: 24, height: 24),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              height: 1,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
