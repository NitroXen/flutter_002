import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/screens/second_screen.dart';
import 'package:flutter_002/widgets/item_cash.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> listitems = [
      Item(name: "Malboro", price: 4.80),
      Item(name: "Ducados", price: 5.00)
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Main Screen"),
        ),
        body: ListView.builder(
            itemCount: listitems.length,
            itemBuilder: (context, index) {
              return ItemCash(item: listitems[index]);
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreen(listItem: listitems)),
                ),
            child: Icon(Icons.shop)));
  }
}
