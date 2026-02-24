import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'verification_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: screenHeight * 0.2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'المطعم السحابي',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik",
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                          ],
                        ),
                      ),
                    ),
                    InputFieldName(screenWidth: screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    InputFieldNumber(screenWidth: screenWidth),
                    SizedBox(height: screenHeight * 0.15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                      child: _buildButton(
                        text: "تسجيل الدخول",
                        backgroundColor: Colors.yellow,
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerificationScreen(verificationId: '',)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildSocialMediaIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container InputFieldNumber({required double screenWidth}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: numberController,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            labelText: "رقم المستخدم",
            labelStyle: TextStyle(color: Colors.grey.withOpacity(0.7), fontFamily: "Rubik", fontSize: 12),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
          ),
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontFamily: "Rubik",
          ),
        ),
      ),
    );
  }

  Container InputFieldName({required double screenWidth}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: nameController,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            labelText: 'اسم المستخدم',
            labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9), fontFamily: "Rubik", fontSize: 12),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
          ),
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontFamily: "Rubik",
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    
    IconButton(
      icon: FaIcon(FontAwesomeIcons.instagram),
      onPressed: () {
        // Handle Instagram action
      },
    ),
    IconButton(
      icon: FaIcon(FontAwesomeIcons.facebook),
      onPressed: () {
        // Handle Facebook action
      },
    ),
    IconButton(
      icon: FaIcon(FontAwesomeIcons.tiktok),
      onPressed: () {
        // Handle TikTok action
      },
    ),
    IconButton(
      icon: FaIcon(FontAwesomeIcons.twitter), // X (formerly Twitter)
      onPressed: () {
        // Handle X action
      },
    ),
  ],
);

  }
}

Widget _buildButton({
  required String text,
  required Color backgroundColor,
  required Color textColor,
  required VoidCallback onPressed,
  double height = 65,
  double borderRadius = 15,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: textColor,
      backgroundColor: backgroundColor,
      minimumSize: Size(double.infinity, height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(fontFamily: "Rubik", fontSize: 15),
    ),
  );
}
