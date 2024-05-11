import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AndroidLarge9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 360,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/logo_telikoCOLOURED-02.svg', // Ensure this path is correct for your assets
                    width: 165,
                    height: 154,
                  ),
                ),
                SizedBox(height: 10),  // Reduced space after the logo
                Text(
                  'Λίγες ακόμα πληροφορίες',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 40,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 20), // Reduced space before the text fields
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFF1E1E1E)),
                    ),
                    labelText: 'Ονοματεπώνυμο',
                    labelStyle: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Reduced space between text fields
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFF1E1E1E)),
                    ),
                    labelText: 'Ημερομηνία γέννησης',
                    labelStyle: TextStyle(
                      color: Color(0xFF49454F),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFF1E1E1E)),
                    ),
                    labelText: 'Φύλο',
                    labelStyle: TextStyle(
                      color: Color(0xFF49454F),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Expanded(
                      child: Text(
                        'Έχω διαβάσει και αποδέχομαι, τους Όρους χρήσης και την Πολιτική Απορρήτου',
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), // Reduced space between checkboxes
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Expanded(
                      child: Text(
                        'Επιθυμώ να λαμβάνω ενημερωτικά emails',
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Reduced space before the captcha
                Container(
                  width: 307,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    border: Border.all(color: Color(0xFFD6D6D6), width: 1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.check_box_outline_blank, size: 24, color: Color(0xFFC1C1C1)),
                      SizedBox(width: 14),
                      Text(
                        "I’m not a robot",
                        style: TextStyle(
                          color: Color(0xFF79747E),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      FlutterLogo(size: 48),
                      SizedBox(width: 4),
                      Text(
                        "Privacy - Terms",
                        style: TextStyle(
                          color: Color(0xFF79747E),
                          fontSize: 8,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Reduced space before the final button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next screen or submit form data
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE4572E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15), // Adjust padding for a larger button
                    ),
                    child: Text(
                      'Προχωρήστε',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
