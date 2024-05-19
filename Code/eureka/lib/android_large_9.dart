//register2
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:your_app_name/android_large_10.dart';

class AndroidLarge9 extends StatefulWidget {
  @override
  _AndroidLarge9State createState() => _AndroidLarge9State();
}

class _AndroidLarge9State extends State<AndroidLarge9> {
  bool _termsAccepted = false;
  bool _newsletterSubscribed = false;
  bool _notARobotChecked = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFE4572E), // Button color
              onPrimary: Colors.white, // Text color on button
              onSurface: Colors.black, // Default text color
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  void _showWarning(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
              color: Color(0xFF79747E)), // Text color matching robot check
        ),
        backgroundColor:
            Color(0xFFFAFAFA), // Background color matching robot check
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _validateAndProceed() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You must enter your name!'),
        duration: Duration(seconds: 2),
      ));
    } else if (_dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You must enter birth date!'),
        duration: Duration(seconds: 2),
      ));
    } else if (_selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You must select your gender!'),
        duration: Duration(seconds: 2),
      ));
    } else if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You must accept the Terms of Use and Privacy Policy!'),
        duration: Duration(seconds: 2),
      ));
    } else if (!_notARobotChecked) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You must confirm that you are not a robot!'),
        duration: Duration(seconds: 2),
      ));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AndroidLarge10()),
      );
    }
  }

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
                SizedBox(height: 10), // Reduced space after the logo
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
                  controller: _nameController,
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
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
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
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['MALE', 'FEMALE', 'OTHER']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
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
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value!;
                        });
                      },
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
                      value: _newsletterSubscribed,
                      onChanged: (value) {
                        setState(() {
                          _newsletterSubscribed = value!;
                        });
                      },
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _notARobotChecked = !_notARobotChecked;
                    });
                  },
                  child: Container(
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
                        Icon(
                          _notARobotChecked
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          size: 24,
                          color: Color(0xFFC1C1C1),
                        ),
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
                ),
                SizedBox(height: 10), // Reduced space before the final button
                Center(
                  child: ElevatedButton(
                    onPressed: _validateAndProceed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE4572E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15), // Adjust padding for a larger button
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
