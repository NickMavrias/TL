import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:your_app_name/android_large_7.dart'; // Update with your actual package name

class AndroidLarge12 extends StatelessWidget {
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

  const AndroidLarge12({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoCustomizationScreen(
        username: username,
        email: email,
        phone: phone,
        password: password,
        name: name,
        birthday: birthday,
        gender: gender,
        newsletter: newsletter,
        bio: bio,
        interests: interests,
      ),
    );
  }
}

class PhotoCustomizationScreen extends StatefulWidget {
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

  const PhotoCustomizationScreen({
    Key? key,
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
  }) : super(key: key);

  @override
  _PhotoCustomizationScreenState createState() =>
      _PhotoCustomizationScreenState();
}

class _PhotoCustomizationScreenState extends State<PhotoCustomizationScreen> {
  final List<File> _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationPageContent(
          selectedImages: _selectedImages,
          onImageSelected: (File image) {
            setState(() {
              if (_selectedImages.length < 6) {
                // Assuming a maximum of 6 photos can be selected
                _selectedImages.add(image);
              }
            });
          },
          username: widget.username,
          email: widget.email,
          phone: widget.phone,
          password: widget.password,
          name: widget.name,
          birthday: widget.birthday,
          gender: widget.gender,
          newsletter: widget.newsletter,
          bio: widget.bio,
          interests: widget.interests,
        ),
      ],
    );
  }
}

class CustomizationPageContent extends StatelessWidget {
  final List<File> selectedImages;
  final Function(File) onImageSelected;
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

  const CustomizationPageContent({
    Key? key,
    required this.selectedImages,
    required this.onImageSelected,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLogo(),
        _buildTitle(),
        _buildSubTitle(),
        _buildPhotoPlaceholders(context),
        _buildNextButton(context),
      ],
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: SvgPicture.asset(
        'assets/images/logo_telikoCOLOURED-02.svg',
        width: 200,
        height: 100,
      ),
    );
  }

  Widget _buildTitle() {
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

  Widget _buildPhotoPlaceholders(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        runSpacing: 20,
        children:
            List.generate(6, (index) => _buildPhotoPlaceholder(context, index)),
      ),
    );
  }

  Widget _buildPhotoPlaceholder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () async {
        bool hasPermission = await requestStoragePermission();
        if (!hasPermission) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Permission to access the gallery is required!")));
          return;
        }

        try {
          if (index < selectedImages.length || selectedImages.length < 6) {
            final ImagePicker _picker = ImagePicker();
            final XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              onImageSelected(File(image.path));
            }
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed to pick image: $e")));
        }
      },
      child: Container(
        width: 92.92,
        height: 134.58,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Color(0xFF1E1E1E)),
          borderRadius: BorderRadius.circular(8),
          image: index < selectedImages.length
              ? DecorationImage(
                  image: FileImage(selectedImages[index]),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: index >= selectedImages.length
            ? Icon(Icons.add, color: Color(0xFF1E1E1E))
            : null,
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AndroidLarge7(
                username: username,
                email: email,
                phone: phone,
                password: password,
                name: name,
                birthday: birthday,
                gender: gender,
                newsletter: newsletter,
                bio: bio,
                interests: interests,
                photos: selectedImages,
              ),
            ),
          );
        },
        child: const Text('Επόμενο'),
      ),
    );
  }

  // Function to request storage permission
  Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      var result = await Permission.storage.request();
      return result.isGranted;
    } else if (status.isPermanentlyDenied) {
      // Open app settings if permission is permanently denied
      openAppSettings();
      return false;
    }
    return false;
  }
}
