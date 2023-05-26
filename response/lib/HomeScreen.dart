import 'package:flutter/material.dart';
import 'package:response/main.dart';
import 'drawer.dart';

class Home{

static var appbar = AppBar(
  backgroundColor: Appdata.barcolor,
  title: const Text('Response', style: Appdata.titlestyle,),
);

static var screen = Scaffold(
  drawer: const NavDrawer(),
  backgroundColor: Appdata.bgcolor,
  body: Body.line,
  appBar: appbar);
}

class Body{
  static var line = Row(
    children: const [
      Spacer(flex: 3,),
      Text('Your signals', style: Appdata.textstyle,),
      Spacer(flex: 9,),
    ],
  );
}


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Home.screen;
  }
}

