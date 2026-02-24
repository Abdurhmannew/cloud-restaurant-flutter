import 'package:cloudy_resturant/model/favorites_model.dart';
import 'package:cloudy_resturant/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloudy_resturant/model/food_item.dart';
import 'package:cloudy_resturant/view/meal_details.dart';
import 'package:cloudy_resturant/view/favorites_screen.dart';
import 'package:cloudy_resturant/view/cartScreen.dart';
import 'package:cloudy_resturant/view/Settings_Screen.dart';
import 'package:cloudy_resturant/view/home_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HealthyScreen extends StatelessWidget {
  final List<FoodItem> items;

  const HealthyScreen({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: _buildSectionTitle("قائمة وجبات الطعام الصحي"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeView()));
          },
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(context),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildHealthyCard(item, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Rubik",
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Center(
      child: SizedBox(
        height: 35,
        width: MediaQuery.of(context).size.width * 0.85,
        child: TextField(
          controller: searchController,
          textAlign: TextAlign.right, // Align text to the right
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search), // Icon on the right
            hintText: 'بحث',
            hintTextDirection: TextDirection.rtl, // Ensure hint is RTL
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 3.0),
          ),
          style: const TextStyle(fontFamily: "Rubik", fontSize: 13),
          onChanged: (value) {
            // Implement search functionality here
          },
        ),
      ),
    );
  }

Widget _buildHealthyCard(FoodItem item, BuildContext context) {

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetailsScreen(item: item, cartItems: []),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(item.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Bottom Container for Add Icon and Item Details
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                  bottom: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add to Cart Icon
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.green),
                      onPressed: () {
                        _showTransparentLogoutNotification(
                          context,
                          message: ' تمت اضافة ${item.name} إلى السلة ',
                        );
                      },
                    ),
                    // Item Name and Price
                    Flexible(
                      child: Text(
                        '${item.name}\n${item.price} ريال',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Rubik",
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Heart Icon at Top-Right Corner
          Positioned(
            top: 8,
            right: 8,
            child: Consumer<FavoritesModel>(
              builder: (context, favoritesModel, child) {
                final isFavorite = favoritesModel.isFavorite(item);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      favoritesModel.removeFavorite(item);
                      _showTransparentLogoutNotification(
                        context,
                        message: '${item.name} أزيل من المفضلة!',
                      );
                    } else {
                      favoritesModel.addFavorite(item);
                      _showTransparentLogoutNotification(
                        context,
                        message: '${item.name} أضيف إلى المفضلة!',
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
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
                fontSize: 14,
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

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: const Color.fromARGB(255, 235, 231, 231),
        ),
        Container(
          height: 70,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navBarItem(
                      context: context,
                      icon: LineIcons.cog,
                      label: "الإعدادات",
                      destination: const SettingsScreen(),
                    ),
                    _navBarItem(
                      context: context,
                      icon: Icons.shopping_bag,
                      label: "السلة",
                      destination: CartScreen(onNavigateToPage: (int ) {  },),
                    ),
                    const SizedBox(width: 70), // Space for Home button
                    _navBarItem(
                      context: context,
                      icon: LineIcons.heart,
                      label: "المفضلة",
                      destination: FavoritesScreen(),
                    ),
                    _navBarItem(
                      context: context,
                      icon: LineIcons.user,
                      label: "بروفايل",
                      destination: const ProfileScreen(),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 7,
                left: MediaQuery.of(context).size.width / 2 - 35,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => HomeView()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    width: 65,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 253, 216, 53),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(LineIcons.home,
                        size: 32, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _navBarItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Widget destination,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: Colors.grey),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontFamily: "Rubik",
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
