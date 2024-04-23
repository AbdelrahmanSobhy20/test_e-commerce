import 'package:e_commerce_app/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'home_screen.dart';

class NAV extends StatefulWidget {
  const NAV({Key? key}) : super(key: key);

  @override
  State<NAV> createState() => _NAVState();
}

class _NAVState extends State<NAV> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const Cart(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
            screens[currentIndex];
          });
        },
        height: 80,
        elevation: 0,
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
          NavigationDestination(
              icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
