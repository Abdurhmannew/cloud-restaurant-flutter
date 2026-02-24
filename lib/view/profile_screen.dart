import 'package:cloudy_resturant/view/LoginSignin_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _buildSectionTitle("حسابي"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            _showTransparentLogoutNotification(context);

            // Navigate to login screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginSigninScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            _buildInfoField('الاسم'),
            const SizedBox(height: 20),
            _buildInfoField('الرقم'),
            const SizedBox(height: 20),
            const Text(
              'العنوان الحالي',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: "Rubik",
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Text(
                  'Map area can be replaced with another widget',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add edit location functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 253, 216, 53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'تعديل',
                  style: TextStyle(color: Colors.black, fontFamily: "Rubik"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTransparentLogoutNotification(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50, // Position at the top of the screen
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'تم تسجيل الخروج!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Rubik",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    // Show the notification
    overlay.insert(overlayEntry);

    // Remove the notification after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  Widget _buildInfoField(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 216, 53),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: "Rubik",
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Rubik",
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
