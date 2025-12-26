import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';

class GrocerySearch extends StatefulWidget {
  const GrocerySearch({super.key});

  @override
  State<GrocerySearch> createState() => _GrocerySearchState();
}

class _GrocerySearchState extends State<GrocerySearch> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    final filteredGroceries = dummyGroceryItems.where((grocery) {
      return grocery.name.toLowerCase().contains(text.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('All Groceries')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredGroceries.isEmpty
                ? const Center(child: Text('No groceries found'))
                : ListView.builder(
                    itemCount: filteredGroceries.length,
                    itemBuilder: (context, index) {
                      final grocery = filteredGroceries[index];
                      return ListTile(
                        leading: Container(
                          width: 15,
                          height: 15,
                          color: grocery.category.color,
                        ),
                        title: Text(grocery.name),
                        trailing: Text(grocery.quantity.toString()),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
