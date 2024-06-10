import 'package:Resepku/RecipeApp.dart';
import 'package:flutter/material.dart';

class Drawercontent extends StatelessWidget {
  const Drawercontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          drawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                drawerItems(icon: Icons.menu_book, text: 'Masakan Indonesia', onTap: (){}),
                drawerItems(icon: Icons.menu_book, text: 'Masakan Jepang', onTap: (){
                  _showAlertDialog(context);
                }),
                drawerItems(icon: Icons.info, text: 'About App', onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutApp()));
                }),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Versi 0.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Coming Soon'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Closed'),
            ),
          ],
        );
      },
    );
  }
}

Widget drawerHeader(){
  return DrawerHeader(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/drawerimg.jpg'),
            fit: BoxFit.cover
        )
    ),
    child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/applogo.png'),
    ),
  );
}

Widget drawerItems({
  required IconData icon,
  required String text,
  required GestureTapCallback onTap
}) {
  return ListTile(
    title: Row(
      children: [
        Icon(icon),
        Padding(padding: const EdgeInsets.only(left: 25.0),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold),),)
      ],
    ),
    onTap: onTap,
  );
}
