import 'package:cloudy_resturant/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase Initialization
import 'package:cloudy_resturant/model/cart_model.dart';
import 'package:cloudy_resturant/model/favorites_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => FavoritesModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloudy Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: "Rubik", // Custom font (ensure it's added in pubspec.yaml)
      ),
      home: SplashScreen(), // Make sure SplashScreen exists
    );
  }
}
