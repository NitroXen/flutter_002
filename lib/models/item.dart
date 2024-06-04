class Item {
  int id;
  String name;
  double price;
  int quantity = 0;

  Item({required this.id, required this.name, required this.price});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'price': price};
  }
}
