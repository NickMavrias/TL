import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_app_name/android_large_7.dart';

class AndroidLarge6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 23.23,
                top: 165.03,
                child: SizedBox(
                  width: 240.86,
                  height: 66.88,
                  child: Text(
                    'ίσοδος',
                    textAlign: TextAlign.left,
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
                left: 23.45,
                top: 231.91,
                child: SizedBox(
                  width: 240.86,
                  height: 23.80,
                  child: Text(
                    'Παρακαλώ συνδεθείτε για να προχωρήσετε',
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
                left: 52.07,
                top: 757.27,
                child: SizedBox(
                  width: 132.83,
                  height: 23.80,
                  child: Text(
                    'Δεν έχετε λογαριασμό?',
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
                    'Εγγραφείτε τώρα',
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
                left: 196.44,
                top: 459.05,
                child: SizedBox(
                  width: 140.78,
                  height: 23.80,
                  child: Text(
                    'Ξέχασα τα στοιχεία σύνδεσης',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE4572E),
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w200,
                      height: 1.4,
                      letterSpacing: 0.10,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24.23,
                top: 311,
                child: Container(
                  width: 313,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF1E1E1E)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Όνομα χρήστη ή E-mail',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 1.1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24.23,
                top: 398,
                child: Container(
                  width: 313,
                  height: 59,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF1E1E1E)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Kωδικός πρόσβασης',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 1.1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 27.23,
                top: 484.91,
                child: SizedBox(
                  width: 310,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AndroidLarge7()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE4572E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Σύνδεση',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25.23,
                top: 591.76,
                child: SizedBox(
                  width: 312,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE4572E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Λογαριασμό Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 23.23,
                top: 663.13,
                child: SizedBox(
                  width: 312,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE4572E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Αριθμό τηλεφώνου',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 134.82,
                top: 553.83,
                child: Text(
                  'Ή συνδεθείτε με',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE4572E),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              Positioned(
                left: 23.29,
                top: 565.80,
                child: Container(
                  width: 108.08,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 233.26,
                top: 565.80,
                child: Container(
                  width: 103.97,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: -160,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/logo_telikoCOLOURED-02.svg',
                  width: 250,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
