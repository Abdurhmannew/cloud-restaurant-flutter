import 'package:flutter/material.dart';

class MealsMenuScreen extends StatelessWidget {
  const MealsMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("قائمة الوجبات")),
      body: ListView(
        children: List.generate(3, (index) => MealCard()),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          color: Colors.grey[300],
        ),
        title: Text("اسم الوجبة"),
        subtitle: Text("المطعم: السعر"),
      ),
    );
  }
}
