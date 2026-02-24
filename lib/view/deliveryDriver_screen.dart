import 'package:cloudy_resturant/view/deliverdOrders_screen.dart';
import 'package:flutter/material.dart';

class DeliveryDriverScreen extends StatelessWidget {
  const DeliveryDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: _buildTitle(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            buildMenuButton(
              text: 'قائمة الطلبات',
              color: Colors.yellow,
              icon: Icons.list,
              iconColor: Colors.black,
              onTap: () {
                // Add navigation to the orders list screen here
              },
            ),
            const SizedBox(height: 20),
            buildMenuButton(
              text: 'قائمة الطلبات التي تم تسليمها',
              color: Colors.yellow,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveredOrdersScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton({
    required String text,
    required Color color,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap, // Add onTap callback
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "Rubik",
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTitle(BuildContext context) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
           
          },
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
                'assets/images/profile_picture.png'), // Replace with your profile image path
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 8),
            const Text(
              'المطعم السحابي',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    ],
  );
}
