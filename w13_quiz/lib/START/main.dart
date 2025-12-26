import 'package:flutter/material.dart';
import 'package:w4_app/START/ui/groceries/grocery_search.dart';
import 'ui/groceries/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum GroceryTab { viewTab, searchTab }

class _MyAppState extends State<MyApp> {
  GroceryTab currentTab = GroceryTab.viewTab;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home: Scaffold(
        body: IndexedStack(
          index: currentTab.index,
          children: [
            GroceryList(),
            GrocerySearch()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: currentTab.index,
          onTap: (index) {
            setState(() {
              currentTab = GroceryTab.values[index];
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
