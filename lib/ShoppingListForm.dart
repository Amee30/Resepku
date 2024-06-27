import 'package:Resepku/db/db_helper.dart';
import 'package:Resepku/model/ShoppingList.dart';
import 'package:flutter/material.dart';

class Shoppinglistform extends StatefulWidget {
  final Shoppinglist? shoppinglist;
  final Function? onUpdate;

  const Shoppinglistform({super.key, this.shoppinglist, this.onUpdate});

  @override
  _ShoppingListFormState createState() => _ShoppingListFormState();
}

class _ShoppingListFormState extends State<Shoppinglistform> {
  DbHelper db = DbHelper();

  TextEditingController? title;
  TextEditingController? content;

  @override
  void initState() {
    title = TextEditingController(
      text: widget.shoppinglist == null ? '' : widget.shoppinglist!.title
    );
    content = TextEditingController(
        text: widget.shoppinglist == null ? '' : widget.shoppinglist!.content
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
            'Tambah Daftar Belanja',
          style: TextStyle(color: Colors.white),
        )
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: title,
            decoration: InputDecoration(
              labelText: 'Nama List',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),
          ),
          const SizedBox(height: 25,),
          TextField(
            controller: content,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                labelText: 'Masukan Daftar Belanja',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),
          ),
          const SizedBox(height: 25,),
          ElevatedButton(
              onPressed: () {
                upsertList();
              },
              child: (widget.shoppinglist == null)
              ? const Text(
                'Add',
                style: TextStyle(color: Colors.black),
              )
              : const Text(
                'Update',
                style: TextStyle(color: Colors.black),
              ),
          )
        ],
      ),
    );
  }

  Future<void> upsertList() async {
    if(widget.shoppinglist != null){
      await db.updateShoppingList(Shoppinglist.fromMap({
        'id' : widget.shoppinglist!.id,
        'title' : title!.text,
        'content' : content!.text,
      }));
      widget.onUpdate!();
      Navigator.pop(context, 'update');
    } else {
      await db.saveShoppingList(Shoppinglist(
        title: title!.text,
        content: content!.text,
      ));
      widget.onUpdate!();
      Navigator.pop(context, 'save');
    }
  }
}