import 'package:flutter/material.dart';

class ProcessOrderScreen extends StatelessWidget {
  const ProcessOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("معالجة الطلب")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            OrderDetailRow("اسم المستخدم:", "عبدالرحمن"),
            OrderDetailRow("رقم المستخدم:", "6787668"),
            OrderDetailRow("رقم الطلب:", "12"),
            OrderDetailRow("التاريخ:", "5/10/2024"),
            OrderDetailRow("الوقت:", "6:47PM"),
            OrderDetailRow("العنوان:", "اليمن"),
            OrderDetailRow("المطعم:", "رويال برجر"),
            Divider(height: 30),
            OrderTable(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text("معالجة الطلب"),
            )
          ],
        ),
      ),
    );
  }
}

class OrderDetailRow extends StatelessWidget {
  final String title, value;

  const OrderDetailRow(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}

class OrderTable extends StatelessWidget {
  const OrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.yellow),
      children: [
        _buildRow(['الوجبة', 'السعر', 'الكمية', 'الإجمالي']),
        _buildRow(['برجر', '1500', '1', '1500']),
        _buildRow(['الإجمالي', '', '', '1500']),
        _buildRow(['التوصيل', '', '', '500']),
        _buildRow(['الإجمالي النهائي', '', '', '2000']),
      ],
    );
  }

  TableRow _buildRow(List<String> cells) {
    return TableRow(
      children: cells
          .map((cell) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(cell)),
              ))
          .toList(),
    );
  }
}
