import 'package:cloudy_resturant/model/food_item.dart';
import 'package:cloudy_resturant/model/favorites_model.dart';
import 'package:cloudy_resturant/view/home_view.dart';
import 'package:cloudy_resturant/view/meal_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LunchScreen extends StatelessWidget {
  final List<FoodItem> items;

  const LunchScreen({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: _buildSectionTitle("قائمة وجبات الغداء"),
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
                return _buildLunchCard(item, context);
              },
            ),
          ),
        ],
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

  Widget _buildLunchCard(FoodItem item, BuildContext context) {
    final favoritesModel = Provider.of<FavoritesModel>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetailsScreen(
              item: item,
              cartItems: [],
            ),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                    top: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.green),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item.name} أضيف إلى السلة!'),
                            ),
                          );
                        },
                      ),
                      Text(
                        '${item.name}\n ${item.price} ريال',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Rubik",
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  favoritesModel.isFavorite(item)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: favoritesModel.isFavorite(item)
                      ? Colors.red
                      : Colors.grey,
                ),
                onPressed: () {
                  if (favoritesModel.isFavorite(item)) {
                    favoritesModel.removeFavorite(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} أزيل من المفضلة!')),
                    );
                  } else {
                    favoritesModel.addFavorite(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} أضيف إلى المفضلة!')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
