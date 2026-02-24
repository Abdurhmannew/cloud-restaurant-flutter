import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloudy_resturant/model/cart_model.dart';
import 'package:cloudy_resturant/model/food_item.dart';

class CartScreen extends StatefulWidget {
  final Function(int) onNavigateToPage;

  const CartScreen({super.key, required this.onNavigateToPage});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    final cartItems = cartModel.items;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "السلة",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final entry = cartItems.entries.elementAt(index);
                      final item = entry.key;
                      final quantity = entry.value;

                      return Dismissible(
                        key: Key(item.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          cartModel.removeItem(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("${item.name} تم حذفه من السلة")),
                          );
                        },
                        child: CartItem(item: item, quantity: quantity),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "السلة فارغة",
                      style: TextStyle(fontSize: 12, fontFamily: "Rubik"),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(350, 60),
              ),
              onPressed: () {
                if (cartItems.isNotEmpty) {
                  widget.onNavigateToPage(9); // Navigate to InvoiceScreen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("السلة فارغة!")),
                  );
                }
              },
              child: const Text(
                'اعتماد الطلب',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rubik",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final FoodItem item;
  final int quantity;

  const CartItem({super.key, required this.item, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          _buildCartItem(),
        ],
      ),
    );
  }

  Expanded _buildCartItem() {
    return Expanded(
      child: SizedBox(
        height: 130,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "الوجبة: ${item.name}",
                        style:
                            const TextStyle(fontFamily: "Rubik", fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'السعر: ${item.price} ريال',
                        style:
                            const TextStyle(fontFamily: "Rubik", fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'العدد: $quantity',
                        style:
                            const TextStyle(fontFamily: "Rubik", fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.imageUrl,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
