import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_app_name/android_large_9.dart';


class AndroidLarge8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 360,
            // Flexible height to accommodate all children
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
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
                      onPressed: () {
                        // Navigate to AndroidLarge9 when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AndroidLarge9()),
                        );
                      },
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
