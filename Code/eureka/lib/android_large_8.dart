// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:your_app_name/android_large_9.dart';
import 'package:your_app_name/android_large_6.dart';

class AndroidLarge8 extends StatefulWidget {
  @override
  _AndroidLarge8State createState() => _AndroidLarge8State();
}

class _AndroidLarge8State extends State<AndroidLarge8> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _validateAndProceed() async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    final phoneRegExp = RegExp(r'^69\d{8}$');

    if (!emailRegExp.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid email address!'),
        ),
      );
      return;
    }

    if (!phoneRegExp.hasMatch(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Phone number must be 10 digits and start with 69!'),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords must be the same!'),
        ),
      );
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.2.3:8080/api/users/check-unique?username=$username&email=$email'),
      );

      if (response.body == "Both username and email are unique") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AndroidLarge9(
              username: username,
              email: email,
              phone: phone,
              password: password,
            ),
          ),
        );
      } else if (response.body == "Username already exists") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Username already exists!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email already exists!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 360,
            height: 1200,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 23.23,
                  top: 165.03,
                  child: SizedBox(
                    width: 270.11,
                    height: 66.88,
                    child: Text(
                      'Εγγραφή',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 64,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        height: 1,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 61.89,
                  top: 757.27,
                  child: SizedBox(
                    width: 132.83,
                    height: 23.80,
                    child: Text(
                      'Έχετε λογαριασμό?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        height: 1.2,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 184.99,
                  top: 757.27,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AndroidLarge6()),
                      );
                    },
                    child: SizedBox(
                      width: 99.94,
                      height: 23.80,
                      child: Text(
                        'Συνδεθείτε τώρα',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE4572E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24.23,
                  top: 259,
                  child: Container(
                    width: 313,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFF1E1E1E)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        hintText: 'Όνομα χρήστη',
                        hintStyle: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Positioned(
                  left: 24.23,
                  top: 340,
                  child: Container(
                    width: 313,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFF1E1E1E)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                Positioned(
                  left: 23.23,
                  top: 424.57,
                  child: Container(
                    width: 313,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFF1E1E1E)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        hintText: 'Τηλέφωνο',
                        hintStyle: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                Positioned(
                  left: 26.84,
                  top: 509.14,
                  child: Container(
                    width: 313,
                    height: 59,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFF1E1E1E)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        hintText: 'Kωδικός πρόσβασης',
                        hintStyle: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      obscureText: true,
                    ),
                  ),
                ),
                Positioned(
                  left: 28.34,
                  top: 589.14,
                  child: Container(
                    width: 313,
                    height: 59,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFF1E1E1E)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        hintText: 'Επιβεβαίωση κωδικού πρόσβασης',
                        hintStyle: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      obscureText: true,
                    ),
                  ),
                ),
                Positioned(
                  left: 25.73,
                  top: 692,
                  child: SizedBox(
                    width: 310,
                    height: 51,
                    child: ElevatedButton(
                      onPressed: _validateAndProceed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE4572E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        'Προχωρήστε',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8.66,
                  top: 1.29,
                  child: SvgPicture.asset(
                    'assets/images/logo_telikoCOLOURED-02.svg',
                    width: 165,
                    height: 154.08,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
