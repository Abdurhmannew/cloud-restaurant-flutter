import 'package:cloudy_resturant/view/createAccount_screen.dart';
import 'package:cloudy_resturant/view/login_screen.dart';
import 'package:flutter/material.dart';

class LoginSigninScreen extends StatelessWidget {
  const LoginSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container for the image
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 30), // Adjust the padding as needed
              child: Image.asset(
                'assets/images/pizza-full.png', // Ensure the correct path to your image
                height: 400,  // Adjust height as needed
              ),
            ),
            SizedBox(height: 50), // Space between image and text

            // Container for the text
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
                children: [
                  Text(
                    "  اطلب افضل الوجبات من خلال المطعم السحابي",
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 15),
                  Text(
                    " تقديم وجبات متميزة بجودة عالية و اسعار مناسبة و تخصيص الوجبات باستخدام الذكاء الاصطناعي",
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            SizedBox(height: 100), // Space between text and buttons

            // Container for the buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Reusable button widget with navigation to HomeScreen
                  _buildButton(
                    text: "انشاء حساب",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CreateaccountScreen()),
                      );
                    },
                  ),
                  SizedBox(width: 16), // Space between buttons
                  
                  // Reusable button widget with navigation to HomeScreen
                  _buildButton(
                    text: "تسجيل الدخول",
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom reusable button builder function
  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed, // Accept onPressed parameter for navigation
    double height = 55, // Customizable button height
    double borderRadius = 15, // Customizable border radius
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: Size(160, height), // Set width and height of button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(text, style: TextStyle(fontFamily: "Rubik")),
    );
  }
}

// Placeholder for the HomeScreen widget
