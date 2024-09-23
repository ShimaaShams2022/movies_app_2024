import 'package:flutter/material.dart';

import 'package:movies_app_2024/presentation/categories_screen/categories_screen.dart';
import 'package:movies_app_2024/presentation/home/home_screen.dart';
import 'package:movies_app_2024/presentation/search_screen/search_screen.dart';
import 'package:movies_app_2024/presentation/watch_list_screen/watch_list_screen.dart';
import 'BottomNavItem.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  static const String routeName = "DefaultScreen";

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavItem("HOME", 'iconHome.png'),
          BottomNavItem("SEARCH", 'iconSearch.png'),
          BottomNavItem("BROWSE", 'iconCategories.png'),
          BottomNavItem("WATCHLIST", 'iconWatchList.png'),
        ],
      ),

    );
  }
  var tabs = [HomeScreen(), SearchScreen(),CategoriesScreen(), WatchListScreen()];
}
