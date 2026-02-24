import 'package:flutter/material.dart';
import 'package:cloudy_resturant/model/food_item.dart';
import 'package:cloudy_resturant/model/cart_model.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  final FoodItem item;
  final List<FoodItem> cartItems;

  const MealDetailsScreen({
    super.key,
    required this.item,
    required this.cartItems,
  });

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "تفاصيل الوجبة",
          style: TextStyle(fontFamily: "Rubik"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 130,
                  backgroundImage: AssetImage(widget.item.imageUrl),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title Section
            Center(
              child: Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Quantity Selector
            Center(
              child: _buildQuantitySelector(),
            ),
            const SizedBox(height: 10),

            // Price Section
            Center(
              child: Text(
                'YR ${widget.item.price} :السعر',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 253, 216, 53),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 8),

            // Ratings and Delivery Time Section
            _buildInfoCard(),
            const SizedBox(height: 11),

            // Description Section
            _buildDescriptionSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false)
                    .addItem(widget.item, quantity: quantity);
                _showTransparentLogoutNotification(context,
                    message: 'تم اضافة $quantity ${widget.item.name}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 21, horizontal: 30),
              ),
              child: const Text(
                "اضافة الى السلة",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),
              ),
            ),
            _buildPriceContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQuantityButton(Icons.remove, () {
            setState(() {
              if (quantity > 1) quantity--;
            });
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik',
              ),
            ),
          ),
          _buildQuantityButton(Icons.add, () {
            setState(() {
              quantity++;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 216, 53),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20),
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildPriceContainer() {
  return Container(
    width: 200, // Fixed width to prevent resizing
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 253, 216, 53),
      borderRadius: BorderRadius.circular(10),
    ),
    child: FittedBox(
      fit: BoxFit.scaleDown, // Ensures the content scales to fit
      child: Row(
        children: [
          Text(
            '${(widget.item.price * quantity).toStringAsFixed(2)} ريال',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rubik',
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis, // Prevents overflow
          ),
          const SizedBox(width: 8),
          const Text(
            ':الاجمالي ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rubik',
            ),
            overflow: TextOverflow.ellipsis, // Prevents overflow
          ),
        ],
      ),
    ),
  );
}


  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("التقييم: 4.5/5",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                  )),
              const SizedBox(width: 8),
              Icon(Icons.star, color: Colors.yellow[700], size: 24),
            ],
          ),
          Row(
            children: [
              const Text("وقت التوصيل: 30-40 دقيقة",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                  )),
              const SizedBox(width: 8),
              const Icon(Icons.access_time, color: Colors.red, size: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "الوصف",
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Rubik',
              color: Color.fromARGB(255, 253, 216, 53),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          Text(
            widget.item.description,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Rubik',
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  void _showTransparentLogoutNotification(BuildContext context,
      {required String message}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
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
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
