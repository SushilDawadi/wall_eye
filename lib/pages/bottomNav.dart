import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wall_eye_app/pages/categories.dart';
import 'package:wall_eye_app/pages/home.dart';
import 'package:wall_eye_app/pages/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Home home;
  late Search search;
  late Categories categories;
  late Widget currentPage;

  @override
  void initState() {
    home = const Home();
    search = const Search();
    categories = const Categories();
    pages = [home, search, categories];
    currentPage = const Home();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        color: const Color.fromARGB(255, 84, 87, 93),
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(Icons.category, color: Colors.white)
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
