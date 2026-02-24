import 'package:cloudy_resturant/view/orderStatus_screen.dart';

import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
// Set to cart by default for InvoiceScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "الفاتورة",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Rubik",
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const InfoRow(title: ":رقم الطلب", value: "776"),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            const InfoRow(title: ":التاريخ", value: "2024/10/5"),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            const InfoRow(title: ":الوقت", value: "7:45PM"),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
            const InfoRow(title: ":العنوان", value: "الرويشان"),
            const SizedBox(height: 90),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("الإجمالي",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik")),
                        Text("الكمية",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik")),
                        Text("السعر",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik")),
                        Text("الوجبة",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik")),
                      ],
                    ),
                    const Divider(color: Colors.black),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1500", style: TextStyle(fontFamily: "Rubik")),
                        Text("1", style: TextStyle(fontFamily: "Rubik")),
                        Text("1500", style: TextStyle(fontFamily: "Rubik")),
                        Text("برجر", style: TextStyle(fontFamily: "Rubik")),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1500", style: TextStyle(fontFamily: "Rubik")),
                        Spacer(),
                        Text("الإجمالي", style: TextStyle(fontFamily: "Rubik")),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("500", style: TextStyle(fontFamily: "Rubik")),
                        Spacer(),
                        Text("التوصيل", style: TextStyle(fontFamily: "Rubik")),
                      ],
                    ),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2000", style: TextStyle(fontFamily: "Rubik")),
                        Spacer(),
                        Text("الإجمالي النهائي",
                            style: TextStyle(fontFamily: "Rubik")),
                      ],
                    ),
                    const SizedBox(height: 50),
                    _buildButton(
                      text: "حالة الطلب",
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderStatusScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
    double borderRadius = 10,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: const Size(350, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(text, style: const TextStyle(fontFamily: "Rubik")),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Text(value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: "Rubik", fontSize: 14)),
          ),
          Expanded(
            flex: 2,
            child: Text(title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik",
                    fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class _YellowSectionRow extends StatelessWidget {
  final List<String> items;
  final bool isBold;

  const _YellowSectionRow({required this.items, required this.isBold});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
          .map(
            (item) => Text(
              item,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontFamily: "Rubik",
                  fontSize: 14),
            ),
          )
          .toList(),
    );
  }
}
