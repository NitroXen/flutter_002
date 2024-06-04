import 'package:flutter/material.dart';
import 'package:flutter_002/models/item.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DBItems {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'flutter_database.db'),
        onCreate: (db, version) => db.execute(
              'CREATE TABLE item(id INTEGER PRIMARY KEY, name TEXT, price REAL)',
            ),
        version: 1);
  }

  static Future<void> insertItem(Item item) async {
    final db = await _openDB();
    await db.insert('item', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateItem(Item item) async {
    final db = await _openDB();
    await db
        .update('item', item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }

  static Future<void> deleteItem(int id) async {
    final db = await _openDB();
    await db.delete('item', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Item>> getItems() async {
    final db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query('item');
    return List.generate(maps.length, (i) {
      return Item(
          id: maps[i]['id'], name: maps[i]['name'], price: maps[i]['price']);
    });
  }
}
