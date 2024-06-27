import 'package:Resepku/ShoppingListDetail.dart';
import 'package:Resepku/ShoppingListForm.dart';
import 'package:Resepku/db/db_helper.dart';
import 'package:flutter/material.dart';

import 'model/ShoppingList.dart';

class Listshopping extends StatefulWidget {
  const Listshopping({super.key});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<Listshopping>{
  List<Shoppinglist> listShopping = [];
  DbHelper db = DbHelper();

  @override
  void initState(){
    _getAllShoppingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanja', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: (){
              _openFormCreate();
            },
            icon:  const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listShopping.length,
        itemBuilder: (context, index) {
            Shoppinglist shoppinglist = listShopping[index];

            return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Shoppinglistdetail(shoppinglist)));
              },
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                '${shoppinglist.title}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){
                  AlertDialog delete = AlertDialog(
                    title: const Text('Warning'),
                    content: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Text('Apakah anda yakin ingin menghapus ${shoppinglist.title}?'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _deleteShoppingList(shoppinglist, index);
                            Navigator.pop(context);
                          },
                          child: const Text('Ya')
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text('Tidak')
                      ),
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (context) => delete);
                },
              ),
              leading: IconButton(
                onPressed: () {
                  _openFormEdit(shoppinglist);
                },
                icon: const Icon(Icons.edit),
              ),
            );
          },
      ),
    );
  }



  Future<void> _getAllShoppingList() async {
    var list = await db.getAllShoppingList();
    setState(() {
      listShopping.clear();
      for(var lists in list!) {
        listShopping.add(Shoppinglist.fromMap(lists));
      }
    });
  }

  Future<void> _deleteShoppingList(Shoppinglist shoppinglist, int position) async {
    await db.deleteShoppingList(shoppinglist.id!);
    setState(() {
      listShopping.removeAt(position);
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => Shoppinglistform(onUpdate: _getAllShoppingList))
    );
    if(result == 'save'){
      await _getAllShoppingList();
    }
  }

  Future<void> _openFormEdit(Shoppinglist shoppinglist) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Shoppinglistform(shoppinglist: shoppinglist, onUpdate: _getAllShoppingList))
    );
    if(result == 'update'){
      await _getAllShoppingList();
    }
  }
}