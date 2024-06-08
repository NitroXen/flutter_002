import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/screens/main_screen.dart';
import 'package:flutter_002/services/database.dart';
import 'package:flutter_002/utils/my_style.dart';

class AddScreen extends StatefulWidget {
  Item item;
  bool mod;
  AddScreen({super.key, required this.item, required this.mod});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;

  @override
  void initState() {
    nameController = TextEditingController();
    priceController = TextEditingController();

    nameController.text = widget.item.name;
    priceController.text = widget.item.price.toString();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.mod ? "Modificar Item" : "Añadir Item",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Nombre"),
              ),
              TextField(
                controller: priceController,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp('[0-9.]*'), allow: true)
                ],
                decoration: const InputDecoration(hintText: "Precio"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    ElevatedButton(
                        onPressed: () async {
                          if (widget.mod && priceController.text == "0") {
                            DBItems.deleteItem(widget.item.id);
                          } else {
                            DBItems.insertItem(Item(
                                id: widget.mod
                                    ? widget.item.id
                                    : await DBItems.getID(),
                                name: nameController.text,
                                price: double.parse(priceController.text)));
                          }
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ));
                        },
                        child: Text(widget.mod ? "Modificar" : "Añadir"))
                  ],
                ),
              ),
              Center(
                child: Text(
                  "select price 0 to delete",
                  style: styleTutorial(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
