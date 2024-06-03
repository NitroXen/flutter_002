import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';

class ItemCash extends StatefulWidget {
  Item item;

  ItemCash({super.key, required this.item});

  @override
  State<ItemCash> createState() => _ItemCashState();
}

class _ItemCashState extends State<ItemCash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.item.name + "  " + widget.item.price.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.item.quantity = widget.item.quantity + 1;
                  });
                },
                icon: Icon(Icons.add)),
            Text(widget.item.quantity.toString()),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.item.quantity < 1) {
                      widget.item.quantity = 0;
                    }
                    widget.item.quantity = widget.item.quantity - 1;
                  });
                },
                icon: Icon(Icons.remove))
          ],
        )
      ],
    );
  }
}