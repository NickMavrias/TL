import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AndroidLarge7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: ListView(
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
              ],
            ),
          ),
        ],
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
