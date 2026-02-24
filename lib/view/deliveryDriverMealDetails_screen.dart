import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تفاصيل الطلب',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Rubik',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 216, 53),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'الفاتورة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: const [
                OrderDetailRow(label: ':رقم الطلب', value: '776'),
                OrderDetailRow(label: ':التاريخ', value: '2024/10/5'),
                OrderDetailRow(label: ':الوقت', value: '7:45PM'),
                OrderDetailRow(label: ':العنوان', value: 'الرويشان'),
              ],
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'الوجبات',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 13),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 255, 229, 85), // Yellow background
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Slight shadow
                    blurRadius: 6, // Blurred shadow
                    offset: Offset(0, 3), // Positioned below
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الإجمالي',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        'السعر',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        'الكمية',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        'الوجبة',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Meal Row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1500',
                        style: TextStyle(fontFamily: 'Rubik'),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '1500',
                        style: TextStyle(fontFamily: 'Rubik'),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '1',
                        style: TextStyle(fontFamily: 'Rubik'),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        'برجر',
                        style: TextStyle(fontFamily: 'Rubik'),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black), // Divider line
                  const SizedBox(height: 8),
                  // Totals
                  const TotalRow(label: 'الإجمالي', value: '1500'),
                  const TotalRow(label: 'التوصيل', value: '500'),
                  const TotalRow(label: 'الإجمالي النهائي', value: '2000'),
                  const SizedBox(height: 20),
                  // Delivery Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ), // Fixed shape property
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'تسليم',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),


bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 216, 53),
            borderRadius: BorderRadius.circular(15),
            
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor:
                Colors.transparent, // No background color for icons
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0, // Removes shadow under the bar
          ),
        ),
      ),







    );
  }
}

class OrderDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const OrderDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:  80.0, right: 5,bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Rubik',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Rubik',
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class MealRow extends StatelessWidget {
  final String meal;
  final String quantity;
  final String price;
  final String total;

  const MealRow({super.key, 
    required this.meal,
    required this.quantity,
    required this.price,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          meal,
          style: const TextStyle(fontFamily: 'Rubik'),
          textAlign: TextAlign.right,
        ),
        Text(
          quantity,
          style: const TextStyle(fontFamily: 'Rubik'),
          textAlign: TextAlign.right,
        ),
        Text(
          price,
          style: const TextStyle(fontFamily: 'Rubik'),
          textAlign: TextAlign.right,
        ),
        Text(
          total,
          style: const TextStyle(fontFamily: 'Rubik'),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

class TotalRow extends StatelessWidget {
  final String label;
  final String value;

  const TotalRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Rubik',
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik',
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
