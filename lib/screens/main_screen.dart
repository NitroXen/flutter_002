import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/screens/add_screen.dart';
import 'package:flutter_002/screens/second_screen.dart';
import 'package:flutter_002/services/database.dart';
import 'package:flutter_002/widgets/item_cash.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  late List<Item> listItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddScreen(
                          item: Item(id: 0, name: "", price: 0.0),
                        ),
                      ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Focus(
          child: FutureBuilder(
            future: DBItems.getItems(),
            builder: (context, snapshot) {
              listItem = snapshot.data ?? [];
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    return ItemCash(item: listItem[index]);
                  });
            },
          ),
          onFocusChange: (value) {
            print("Focus: $value");
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreen(listItem: listItem)),
                ),
            child: Icon(Icons.shop)));
  }
}
