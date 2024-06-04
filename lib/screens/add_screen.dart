import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/services/database.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

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
          "add Screen",
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
                decoration: InputDecoration(hintText: "Nombre"),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(hintText: "Precio"),
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
                        child: Text("Cancelar")),
                    ElevatedButton(
                        onPressed: () {
                          // TODO Areglar id para añadir mas items
                          DBItems.insertItem(Item(
                              id: 0,
                              name: nameController.text,
                              price: double.parse(priceController.text)));
                          Navigator.pop(context);
                        },
                        child: Text("Añadir"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
