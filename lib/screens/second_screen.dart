import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';

class SecondScreen extends StatelessWidget {
  List<Item> listItem;
  SecondScreen({super.key, required this.listItem});

  @override
  Widget build(BuildContext context) {
    String list = "";
    for (int i = 0; i < listItem.length; i++) {
      if (listItem[i].quantity > 0) {
        list = list +
            listItem[i].name +
            "  " +
            (listItem[i].price * listItem[i].quantity).toString() +
            "\n";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Text(list.isEmpty ? "No Select object" : list),
      ),
    );
  }
}
