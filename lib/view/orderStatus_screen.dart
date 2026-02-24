import 'package:flutter/material.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  _OrderStatusScreenState createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  final int _currentStep = 2; // Current progress step (0: "تم", 1: "جاري", etc.)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'حالة الطلب',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "Rubik",
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Order Status
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color:                  Color.fromARGB(255, 253, 216, 53),

                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'تحضير الطلب',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Rubik",
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildProgressIndicator('تم', _currentStep >= 0),
                          _buildProgressLine(_currentStep > 0),
                          _buildProgressIndicator('جاري', _currentStep >= 1),
                          _buildProgressLine(_currentStep > 1),
                          _buildProgressIndicator('تحضير', _currentStep >= 2),
                          _buildProgressLine(_currentStep > 1),
                          _buildProgressIndicator('مراجعة', _currentStep >= 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildProgressIndicator(String label, bool isActive) {
    return Column(
      children: [
         Padding(
           padding: const EdgeInsets.only(top: 15,),
           child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isActive ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
         ),
        
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.black : Colors.black54,
            fontFamily: "Rubik",
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

 Widget _buildProgressLine(bool isActive) {
  return Container(
    height: 2,
    width: 60, // Adjust the width of the line to fit your design
    color: isActive ? Colors.black : Colors.black38,
  );
}
}
