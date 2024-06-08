import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/utils/my_style.dart';

// ignore: must_be_immutable
class SecondScreen extends StatelessWidget {
  List<Item>? listItem;
  SecondScreen({super.key, required this.listItem});

  @override
  Widget build(BuildContext context) {
    String list = "";
    double total = 0;
    int count = 0;
    for (int i = 0; i < listItem!.length; i++) {
      if (listItem![i].quantity > 0) {
        list =
            "$list${listItem![i].name} * ${listItem![i].quantity} =  ${(listItem![i].price * listItem![i].quantity).toStringAsFixed(2)}\n";
        count += listItem![i].quantity;
        total += listItem![i].price * listItem![i].quantity;
      }
    }

    list += "\nCantidad : $count --- Total : ${total.toStringAsFixed(2)}";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Text(
          list.isEmpty ? "No Select object" : list,
          style: myStyleProd(),
        ),
      ),
    );
  }
}
