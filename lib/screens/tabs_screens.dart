import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/meals_drawer.dart';

class TabsScreens extends ConsumerStatefulWidget {
  const TabsScreens({super.key});

  @override
  ConsumerState<TabsScreens> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreens> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedFilters = ref.watch(userFilteredMealsProvider);

    //catgories screen
    Widget activePage = CategoriesScreen(userFilteredMeals: selectedFilters);
    //navigating to favorites screen
    if (selectedIndex == 1) {
      final favMeals = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(
        meals: favMeals,
        title: 'Your Favs',
        isFavScreen: true,
      );
    }

    void setScreen(String identifier) async {
      if (identifier == 'Filter') {
        Navigator.pop(context);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
        );
      } else {
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: selectedIndex == 0
          ? AppBar(title: const Text("Categories"))
          : null,
      body: activePage,
      drawer: MealsDrawer(onselectTile: setScreen),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        selectedItemColor: Colors.indigo,
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
