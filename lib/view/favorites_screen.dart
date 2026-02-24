import 'package:cloudy_resturant/model/favorites_model.dart';
import 'package:cloudy_resturant/model/food_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesModel = Provider.of<FavoritesModel>(context);
    final items = favoritesModel.items.keys.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "المفضلة",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Rubik",
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'لا توجد عناصر مفضلة',
                style: TextStyle(fontFamily: "Rubik"),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.8, // Control the card height
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _buildFavoriteCard(item, context, favoritesModel);
                },
              ),
            ),
    );
  }

  Widget _buildFavoriteCard(
    FoodItem item,
    BuildContext context,
    FavoritesModel favoritesModel,
  ) {
    return GestureDetector(
      onTap: () {
        // Handle tap logic if needed, or leave empty
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
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
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
                  color: favoritesModel.isFavorite(item) ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  if (favoritesModel.isFavorite(item)) {
                    favoritesModel.removeFavorite(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} أزيل من المفضلة!')),
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
