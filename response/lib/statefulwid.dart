import 'package:flutter/material.dart';

class StateScreen extends StatefulWidget{
  const StateScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StateScreen();
}

class _StateScreen extends State<StateScreen>{
  int flag = 0;
  void func(){
    setState(
      (){
        flag++;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Center(child: Row(children: [Text('${flag*flag}'), FloatingActionButton(onPressed: func)])),
      )
    );
  }
}