import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'android_large_12.dart'; // Ensure this import is correct

class AndroidLarge10 extends StatefulWidget {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String name;
  final String birthday;
  final String gender;
  final bool newsletter;

  const AndroidLarge10({
    Key? key,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.newsletter,
  }) : super(key: key);

  @override
  _AndroidLarge10State createState() => _AndroidLarge10State();
}

class _AndroidLarge10State extends State<AndroidLarge10> {
  final Set<String> selectedInterests = Set();
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo_telikoCOLOURED-02.svg',
                      width: 165,
                      height: 154.08,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Και τώρα λίγη\nεξατομίκευση',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Για να σας ταιριάξουμε αποδοτικότερα',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '1/2',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _bioController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFF1E1E1E)),
                    ),
                    labelText: 'Σύντομο bio',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                Text(
                  'Ενδιαφέροντα',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (String interest in [
                        'Γυμναστήριο',
                        'Netflix',
                        'DnD',
                        'Τζόγος',
                        'Escape rooms',
                        'Κατοικίδια',
                        'Brunch',
                        'Single malt',
                        'Κρασί',
                        'Μαγειρική',
                        'Μπύρα',
                        'Βινύλια',
                        'Self care',
                        'Mindfullness',
                        'Burger',
                        'Sushi',
                        'Fine dining',
                        'Pub crawls',
                        'Pizza',
                        'Outdoors',
                        'Πιτόγυρα',
                        'Καφές',
                        'Επιτραπέζια',
                        'Βιβλία',
                        'Μουσική',
                        'Κλαμπινγκ',
                        'Αθλήματα'
                      ])
                        InterestButton(
                          interest: interest,
                          selected: selectedInterests.contains(interest),
                          onTap: () {
                            setState(() {
                              if (selectedInterests.contains(interest)) {
                                selectedInterests.remove(interest);
                              } else if (selectedInterests.length < 5) {
                                selectedInterests.add(interest);
                              }
                            });
                          },
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Διαλέχτε έως 5',
                  style: TextStyle(
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w100,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AndroidLarge12(
                            username: widget.username,
                            email: widget.email,
                            phone: widget.phone,
                            password: widget.password,
                            name: widget.name,
                            birthday: widget.birthday,
                            gender: widget.gender,
                            newsletter: widget.newsletter,
                            bio: _bioController.text,
                            interests: selectedInterests.toList(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE4572E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    ),
                    child: Text(
                      'Επόμενο',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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

class InterestButton extends StatelessWidget {
  final String interest;
  final bool selected;
  final VoidCallback onTap;

  InterestButton(
      {required this.interest, required this.onTap, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Color(0xFFE4572E) : Colors.transparent,
          border: Border.all(color: Color(0xFF1E1E1E)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          interest,
          style: TextStyle(
            color: selected ? Colors.white : Color(0xFFE4572E),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
