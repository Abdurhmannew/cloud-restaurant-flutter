import 'package:flutter/material.dart';
import 'deliveryDriverMealDetails_screen.dart'; // Import your OrderDetailsScreen here

class DeliveredOrdersScreen extends StatelessWidget {
  const DeliveredOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: _buildTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            buildOrderCard(context), // Pass context to the function
            const SizedBox(height: 20),
            buildOrderCard(context),
          ],
        ),
      ),
    );
  }

  Widget buildOrderCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 216, 53),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildOrderInfoRow(':اسم المستخدم ', 'حسين'),
          const SizedBox(height: 12),
          buildOrderInfoRow(':رقم الطلب ', '12345'),
          const SizedBox(height: 12),
          buildOrderInfoRow(':رقم المستخدم ', '67890'),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Navigate to OrderDetailsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderDetailsScreen()),
                );
              },
              child: const Text(
                'تفاصيل الطلب',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "Rubik",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOrderInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Rubik",
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Rubik",
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return const Text(
      "الطلبات التي تم تسليمها",
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        fontFamily: "Rubik",
      ),
      textAlign: TextAlign.right,
    );
  }
}
