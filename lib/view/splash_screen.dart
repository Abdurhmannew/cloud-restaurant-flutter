import 'package:flutter/material.dart';
import 'package:cloudy_resturant/view/LoginSignin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Container with increased height
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 253, 216, 53)),
                ),
                child: Image.asset(
                  'assets/images/splash.png', // Ensure this path is correct
                  height: 500, // Increase this value to make the image bigger
                  fit: BoxFit.contain,
                ),
              ),
            ),
           const SizedBox(height: 1,),
           Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'المطعم السحابي',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Rubik",
                      ),
                    ),
                    SizedBox(height: 10),

                    // Subtitle
                    Text(
                      'تقدم أطباق متخصصة حسب توصيات الذكاء الاصطناعي',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontFamily: "Rubik",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 60),

            // Start Button Container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child:_buildButton(text: "ابدأ الان", backgroundColor: Colors.black, textColor: Colors.white, onPressed: () {
                  // Navigate to LoginSigninScreen when the button is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginSigninScreen()),
                  );
                },)
            ),
          ],
        ),
      ),
    );
  }
}
 Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed, // Accept onPressed parameter for navigation
    double height = 65, // Customizable button height
    double borderRadius = 15, // Customizable border radius
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: Size(400, height), // Set width and height of button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(text, style: TextStyle(fontFamily: "Rubik",fontSize: 15),
      ),
    );
  }