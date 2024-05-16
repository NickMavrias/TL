import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AndroidLarge12 extends StatelessWidget {
  const AndroidLarge12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PhotoCustomizationScreen(),
    );
  }
}

class PhotoCustomizationScreen extends StatelessWidget {
  const PhotoCustomizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomizationPageContent(),
      ],
    );
  }
}

class CustomizationPageContent extends StatelessWidget {
  const CustomizationPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLogo(),
        _buildTitle(),
        _buildSubTitle(),
        _buildPhotoPlaceholders(),
        _buildNextButton(context),
      ],
    );
  }

  Widget _buildLogo() {
    // Reducing vertical padding to minimize the gap at the top
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: SvgPicture.asset(
        'assets/images/logo_telikoCOLOURED-02.svg', // Ensure the asset path is correct
        width: 200,
        height: 100,
      ),
    );
  }

  Widget _buildTitle() {
    // Reducing vertical padding
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Λίγη ακόμα εξατομίκευση',
        style: TextStyle(
          color: Color(0xFF1E1E1E),
          fontSize: 24,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildSubTitle() {
    // Reducing vertical padding
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Για να σας γνωρίσουν καλύτερα',
        style: TextStyle(
          color: Color(0xFF49454F),
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildPhotoPlaceholders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 20, // Horizontal space between chips
        runSpacing: 20, // Vertical space between chips
        children: List.generate(6, (index) => _buildPhotoPlaceholder()),
      ),
    );
  }

  Widget _buildPhotoPlaceholder() {
    return Container(
      width: 92.92,
      height: 134.58,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color(0xFF1E1E1E)),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.deepOrange, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: () {
          // Implement the navigation or functionality for the Next button
        },
        child: const Text('Επόμενο'),
      ),
    );
  }
}
