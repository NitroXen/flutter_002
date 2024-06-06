import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/screens/add_screen.dart';
import 'package:flutter_002/screens/second_screen.dart';

import 'package:flutter_002/services/database.dart';
import 'package:flutter_002/widgets/item_cash.dart';
import 'package:flutter_002/utils/my_style.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Item> listItem = [];

  int num = 0;
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Productos"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddScreen(
                          item: Item(id: 0, name: "", price: 0.0),
                          mod: false,
                        ),
                      ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: DBItems.getItems(),
              builder: (context, snapshot) {
                listItem = snapshot.data ?? [];
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    itemCount: listItem.length,
                    itemBuilder: (context, index) {
                      return ItemCash(item: listItem[index]);
                    });
              },
            )),
            const SizedBox(
              height: 15,
            )
          ],
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
