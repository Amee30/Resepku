import 'package:Resepku/model/ShoppingList.dart';
import 'package:flutter/material.dart';

class Shoppinglistdetail extends StatelessWidget {
  final Shoppinglist? shoppinglist;

  Shoppinglistdetail(this.shoppinglist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
            '${shoppinglist!.title}',
            style: const TextStyle(color: Colors.white),
        ),
      ),

      body: ListView.builder(
        itemCount: shoppinglist!.content?.split(',').length, // Memecah string menjadi list berdasarkan koma
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              shoppinglist!.content!.split(',')[index], // Menampilkan setiap item dalam list
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
          );
        },
      ),
    );
  }
}