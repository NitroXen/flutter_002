import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_002/models/item.dart';
import 'package:flutter_002/screens/main_screen.dart';
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
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp('[0-9.]*'), allow: true)
                ],
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
                        onPressed: () async {
                          // TODO Areglar id para añadir mas items
                          DBItems.insertItem(Item(
                              id: await DBItems.getID(),
                              name: nameController.text,
                              price: double.parse(priceController.text)));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => new MainScreen(),
                              ));
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
