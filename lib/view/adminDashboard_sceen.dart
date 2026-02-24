import 'package:cloudy_resturant/view/addMeal_screen.dart';
import 'package:cloudy_resturant/view/mealsMenu_screen.dart';
import 'package:cloudy_resturant/view/processOrder_screen.dart';
import 'package:flutter/material.dart';


class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _buildTitle(context),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          DashboardButton("قائمة الوجبات", Icons.list, MealsMenuScreen()),
          SizedBox(height: 10),
          DashboardButton("إضافة وجبة", Icons.add, AddMealScreen()),
          SizedBox(height: 10),
          DashboardButton("معالجة الطلب", Icons.receipt, ProcessOrderScreen()),
          SizedBox(height: 10),
          DashboardButton("إدارة الطلب", Icons.manage_accounts, Scaffold()), // Placeholder for future screen
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            const Text(
              'المطعم السحابي',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
                color: Colors.black,
              ),
            ),
            SizedBox(width: 8),
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}


class DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget targetScreen; // Target screen for navigation

  const DashboardButton(this.title, this.icon, this.targetScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: Size(double.infinity, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Align all content to the right
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "Rubik",
              ),
            ),
            SizedBox(width: 8), // Spacing between text and icon
            Icon(icon, color: Colors.black),
          ],
        ),
      ),
    );
  }

}
