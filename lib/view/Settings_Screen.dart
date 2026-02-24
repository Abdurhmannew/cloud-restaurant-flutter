import 'package:flutter/material.dart';
import 'package:cloudy_resturant/view/home_view.dart';
import 'package:cloudy_resturant/view/cartScreen.dart';
import 'package:cloudy_resturant/view/favorites_screen.dart';
import 'package:cloudy_resturant/view/profile_screen.dart';
import 'package:line_icons/line_icons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "الإعدادات",
            style: TextStyle(
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Account Section
          _buildSectionTitle("الحساب"),
          _buildSettingItem(
            context,
            icon: Icons.person,
            label: "تعديل الملف الشخصي",
            onTap: () {
              // Navigate to profile editing screen
            },
          ),
          _buildSettingItem(
            context,
            icon: Icons.lock,
            label: "تغيير رقم الهاتف",
            onTap: () {
              // Navigate to phone number change screen
            },
          ),
          const Divider(),

          // Support Section
          _buildSectionTitle("الدعم"),
          _buildSettingItem(
            context,
            icon: Icons.help,
            label: "مركز المساعدة",
            onTap: () {
              // Navigate to help center
            },
          ),
          _buildSettingItem(
            context,
            icon: Icons.contact_support,
            label: "اتصل بنا",
            onTap: () {
              // Navigate to contact us screen
            },
          ),
          const Divider(),

          // About Section
          _buildSectionTitle("حول التطبيق"),
          _buildSettingItem(
            context,
            icon: Icons.info,
            label: "معلومات حول التطبيق",
            onTap: () {
              // Navigate to app info
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "Rubik",
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero, // Remove default padding
      trailing: Icon(icon, color: const Color.fromARGB(255, 253, 216, 53)), // Move the icon to the right and make it yellow
      title: Align(
        alignment: Alignment.centerRight, // Align text to the right
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: "Rubik",
            fontSize: 14,
          ),
          textAlign: TextAlign.right,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, {required int currentIndex}) {
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
                      context,
                      iconOutlined: LineIcons.cog,
                      iconFilled: Icons.settings,
                      label: "الإعدادات",
                      index: 0,
                      isSelected: currentIndex == 0,
                      destination: SettingsScreen(),
                    ),
                    _navBarItem(
                      context,
                      iconOutlined: Icons.shopping_bag,
                      iconFilled: Icons.shopping_bag,
                      label: "السلة",
                      index: 1,
                      isSelected: currentIndex == 1,
                      destination: CartScreen(onNavigateToPage: (int ) {  },),
                    ),
                    const SizedBox(width: 70), // Space for the center home button
                    _navBarItem(
                      context,
                      iconOutlined: LineIcons.heart,
                      iconFilled: Icons.favorite,
                      label: "المفضلة",
                      index: 3,
                      isSelected: currentIndex == 3,
                      destination: FavoritesScreen(),
                    ),
                    _navBarItem(
                      context,
                      iconOutlined: LineIcons.user,
                      iconFilled: Icons.person,
                      label: "بروفايل",
                      index: 4,
                      isSelected: currentIndex == 4,
                      destination: ProfileScreen(),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 7,
                left: MediaQuery.of(context).size.width / 2 - 35,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex != 2) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomeView()),
                        (route) => false,
                      );
                    }
                  },
                  child: Container(
                    width: 65,
                    height: 50,
                    decoration: BoxDecoration(
                      color: currentIndex == 2
                          ? const Color.fromARGB(255, 253, 216, 53)
                          :Color.fromARGB(255, 253, 216, 53),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      LineIcons.home,
                      size: 32,
                      color: currentIndex == 2 ? Colors.black : Colors.grey,
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

  Widget _navBarItem(BuildContext context,
      {required IconData iconOutlined,
      required IconData iconFilled,
      required String label,
      required int index,
      required bool isSelected,
      required Widget destination}) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => destination),
            (route) => false,
          );
        }
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
