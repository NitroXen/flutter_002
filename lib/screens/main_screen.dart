import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/screens/add_screen.dart';
import 'package:flutter_002/screens/second_screen.dart';

import 'package:flutter_002/services/database.dart';
import 'package:flutter_002/widgets/item_cash.dart';
import 'package:flutter_002/utils/my_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Item> listItem = [];
  late DBItems dbItems;

  int num = 0;
  double total = 0.0;

  @override
  void initState() {
    dbItems = DBItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Productos"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: dbItems.getItems(),
                builder: (context, snapshot) {
                  listItem = snapshot.data ?? [];
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listItem.length,
                      itemBuilder: (context, index) {
                        return ItemCash(item: snapshot.data![index]);
                      });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Double tap in text for Reset to 0\n press long in text to modify",
                  style: styleTutorial(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreen(listItem: listItem)),
                ),
            child: const Icon(Icons.shop)));
  }
}
