import 'package:flutter/material.dart';
import 'package:response/main.dart';

import 'createScreen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 60,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Appdata.menucolor,
                  ),
              child: Text(
                'Operations',
                style: Appdata.menustyle,
              )
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_chart),
            title: const Text('Create'),
            onTap: () => {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => CreateScreen()))
            },
          ),
        ],
      ),
    );
  }
}


// var bodycontainer = InkWell(
//   child: Container(
//     color: const Color.fromRGBO(0, 0, 0, 0),
//     child: wid,
//   ),
//   onTap: () => {},
//   splashFactory: NoSplash.splashFactory,
//   splashColor: const Color.fromRGBO(0, 0, 0, 0),
//   mouseCursor: MouseCursor.defer,
//   highlightColor: const Color.fromRGBO(0, 0, 0, 0),
// );