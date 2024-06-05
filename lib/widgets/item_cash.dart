import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/screens/add_screen.dart';

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
        GestureDetector(
          child: Text(
            widget.item.name + " : " + widget.item.price.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          onDoubleTap: () {
            setState(() {
              widget.item.quantity = 0;
            });
          },
          onLongPress: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AddScreen(item: widget.item);
              },
            ));
          },
        ),
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
