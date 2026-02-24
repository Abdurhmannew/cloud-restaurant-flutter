import 'dart:async';
import 'package:cloudy_resturant/controller/home_controller.dart';
import 'package:cloudy_resturant/model/favorites_model.dart';
import 'package:cloudy_resturant/model/food_item.dart';
import 'package:cloudy_resturant/view/Settings_Screen.dart';
import 'package:cloudy_resturant/view/breakfast_screen.dart';
import 'package:cloudy_resturant/view/cartScreen.dart';
import 'package:cloudy_resturant/view/dinner_screen.dart';
import 'package:cloudy_resturant/view/favorites_screen.dart';
import 'package:cloudy_resturant/view/healthy_screen.dart';
import 'package:cloudy_resturant/view/inovice_screen.dart';
import 'package:cloudy_resturant/view/lunch_screen.dart';
import 'package:cloudy_resturant/view/meal_details.dart';
import 'package:cloudy_resturant/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController();

  // Initialize the PageController
  final PageController _pageController = PageController();
  late final Timer _timer;

  int _currentPage = 2; // Default to Home Page

  // Pages for IndexedStack
late final List<Widget> _pages = [
  SettingsScreen(),
  CartScreen(onNavigateToPage: (index) => setState(() => _currentPage = index),),
  HomeContentScreen(),
  FavoritesScreen(),
  ProfileScreen(),
  LunchScreen(items: _controller.getLunchItems()),
  BreakfastScreen(items: _controller.getBreakfastItems()),
  DinnerScreen(items: _controller.getDinnerItems()),
  HealthyScreen(items: _controller.getHealthyFoods()),
  InvoiceScreen(),
   CartScreen(
    onNavigateToPage: (index) => setState(() => _currentPage = index),
  ),
];


  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage >= _controller.getOffers().length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: IndexedStack(
        index: _currentPage,
        children: _pages.map((page) {
          if (page is HomeContentScreen) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: _buildTitle(context),
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: page,
              ),
            );
          }
          return Directionality(
            textDirection: TextDirection.ltr,
            child: page,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       
        Row(
          children: [
            const Text(
              'المطعم السحابي',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
                color: Colors.black,
              ),
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
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
                      iconOutlined: LineIcons.cog,
                      iconFilled: Icons.settings,
                      label: "الإعدادات",
                      index: 0,
                    ),
                    _navBarItem(
                      iconOutlined: Icons.shopping_bag,
                      iconFilled: Icons.shopping_bag,
                      label: "السلة",
                      index: 1,
                    ),
                    const SizedBox(width: 70),
                    _navBarItem(
                      iconOutlined: LineIcons.heart,
                      iconFilled: Icons.favorite,
                      label: "المفضلة",
                      index: 3,
                    ),
                    _navBarItem(
                      iconOutlined: LineIcons.user,
                      iconFilled: Icons.person,
                      label: "بروفايل",
                      index: 4,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 7,
                left: MediaQuery.of(context).size.width / 2 - 35,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentPage = 2;
                    });
                  },
                  child: Container(
                    width: 65,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _currentPage == 2
                          ? const Color.fromARGB(255, 253, 216, 53)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.home,
                        size: 25,
                        color: _currentPage == 2 ? Colors.black : Colors.grey,
                      ),
                    ),
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
    required IconData iconOutlined,
    required IconData iconFilled,
    required String label,
    required int index,
  }) {
    bool isSelected = _currentPage == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentPage = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? iconFilled : iconOutlined,
            size: 28,
            color: isSelected
                ? const Color.fromARGB(255, 253, 216, 53)
                : Colors.grey[600],
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontFamily: "Rubik",
              color: isSelected ? Colors.grey[800] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
// Main Home Page Content
class HomeContentScreen extends StatelessWidget {
  final HomeController _controller = HomeController();
  final PageController _pageController = PageController();

  HomeContentScreen({super.key}); // Properly initialize

  @override
  Widget build(BuildContext context) {
    List<FoodItem> offers = _controller.getOffers();
    List<FoodItem> categories = _controller.getCategories();
    List<FoodItem> recommendations = _controller.getRecommendations();

    FoodItem? healthyFood = categories.firstWhere(
      (category) => category.name == 'طعام صحي',
      orElse: () => FoodItem(name: '', imageUrl: '', price: 0, id: '', description: ''),
    );

    categories = categories.where((category) => category.name != 'طعام صحي').toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildSearchBar(context),
          const SizedBox(height: 20),
          _buildSectionTitle('عروض شهر اكتوبر'),
          const SizedBox(height: 10),
          _buildOffersList(offers),
          const SizedBox(height: 20),
          _buildSectionTitle('الأصناف'),
          const SizedBox(height: 9),
          _buildCategoriesGrid(categories, context),
          const SizedBox(height: 20),
          if (healthyFood.name.isNotEmpty) ...[
            const SizedBox(height: 10),
            _buildHealthyFoodCard(healthyFood, context),
            const SizedBox(height: 20),
          ],
          _buildSectionTitle('التوصيات'),
          const SizedBox(height: 10),
          _buildRecommendationsList(recommendations, context),
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
          prefixIcon: const Icon(Icons.search), // Icon on the right
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
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Rubik",
      ),
      textAlign: TextAlign.center,
    );
  }


  Widget _buildOffersList(List<FoodItem> offers) {
    return SizedBox(
      height: 170,
      child: PageView.builder(
        controller: _pageController, // Attach PageController
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return _buildOfferCard(offers[index]);
        },
      ),
    );
  }

  Widget _buildCategoriesGrid(List<FoodItem> categories, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryCard(categories[index], context);
      },
    );
  }

  Widget _buildRecommendationsList(List<FoodItem> recommendations, BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return _buildRecommendationCard(recommendations[index], context);
        },
      ),
    );
  }

  Widget _buildOfferCard(FoodItem offer) {
    return Container(
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(offer.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(15),
              top: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              '${offer.name} - ${offer.price} ريال',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildCategoryCard(FoodItem category, BuildContext context) {
  return GestureDetector(
    onTap: () {
      final homeViewState = context.findAncestorStateOfType<_HomeViewState>();
      if (homeViewState != null) {
        if (category.name == 'فطور') {
          // ignore: invalid_use_of_protected_member
          homeViewState.setState(() {
            homeViewState._currentPage = 6; // Switch to BreakfastScreen
          });
        } else if (category.name == 'غداء') {
          // ignore: invalid_use_of_protected_member
          homeViewState.setState(() {
            homeViewState._currentPage = 5; // Switch to LunchScreen
          });
        } else if (category.name == 'عشاء') {
          // ignore: invalid_use_of_protected_member
          homeViewState.setState(() {
            homeViewState._currentPage = 7; // Switch to DinnerScreen
          });
        }
      }
    },
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Container(
            height: 180,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(category.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          category.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Rubik",
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}


 Widget _buildRecommendationCard(FoodItem recommendation, BuildContext context) {
  Provider.of<FavoritesModel>(context, listen: false);

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetailsScreen(
            item: recommendation,
            cartItems: [],
          ),
        ),
      );
    },
    child: Container(
      height: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(recommendation.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              width: 160,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                  top: Radius.circular(15),
                ),
              ),
              child: Text(
                '${recommendation.name} ${recommendation.price} YR',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rubik",
                  fontSize: 12,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 3,
            child: Consumer<FavoritesModel>(
              builder: (context, favoritesModel, child) {
                final isFavorite = favoritesModel.isFavorite(recommendation);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      favoritesModel.removeFavorite(recommendation);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${recommendation.name} أزيل من المفضلة!')),
                      );
                    } else {
                      favoritesModel.addFavorite(recommendation);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${recommendation.name} أضيف إلى المفضلة!')),
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

 Widget _buildHealthyFoodCard(FoodItem healthyFood, BuildContext context) {
  return GestureDetector(
    onTap: () {
      final homeViewState = context.findAncestorStateOfType<_HomeViewState>();
      if (homeViewState != null) {
        // ignore: invalid_use_of_protected_member
        homeViewState.setState(() {
          homeViewState._currentPage = 8; // Index of HealthyScreen in _pages
        });
      }
    },
    child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(healthyFood.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          healthyFood.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Rubik",
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
}