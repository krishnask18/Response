import 'package:flutter/material.dart';
import 'package:response/InputSigScreen.dart';
import 'package:response/main.dart';

double factor = 1.16;

class key{
  static var kb = Container(
    width: (70.0*(Row1.length - 2) + 6)*factor,
    height: (TextKey.height*4 + 6)*factor,
    color: Appdata.keybgcolor,
    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
    child: Column(
      children: [Row(
        children: Row1
      ),
        Row(
          children: Row3
      ),
        Row(
            children: Row4
        ),
      Row(
        children : Row2
      )]
    ),
  );
}

 var Row1 = <Widget>[
   const Spacer(flex: 1,),
      const TextKey(
        text: 'sin',
      ),
      const TextKey(
        text: 'cos',
      ),
      const TextKey(
        text: 'exp',
      ),
      const TextKey(
        text: 'PI',
      ),
      const TextKey(
        text: '(',
      ),
      const TextKey(
        text: ')',
      ),
   const Spacer(flex: 1,),
    ];
 var Row2 = <Widget>[
   Spacer(flex : 1),
  const TextKey(
    text: '+',
    width: 69,
  ),
  const TextKey(
    text: '-',
    width: 69,
  ),
  const TextKey(
    text: '*',
    width: 69,
  ),
   const TextKey(
     text: '/',
     width: 69,
   ),
   const TextKey(
     text: '^',
     width: 69,
   ),
   Container(
       color: Appdata.keybgcolor,
       width: 70*factor,
       height: 40*factor,
       padding: const EdgeInsets.all(1.5),
       child: FloatingActionButton(
           shape: const RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(10))
           ),
           backgroundColor: Appdata.bgcolor,
           onPressed: () {
             var t = expression.text, len = t.length;
             if(t==''){
               return;
             }
             bool one_check = t.substring(len - 1) == '1' || t.substring(len - 1) == '2' || t.substring(len - 1) == '3' || t.substring(len - 1) == '4' ||
                 t.substring(len - 1) == '5' || t.substring(len - 1) == '6' || t.substring(len - 1) == '7' || t.substring(len - 1) == '8' ||
                 t.substring(len - 1) == '9' || t.substring(len - 1) == '0' || t.substring(len - 1) == '(' || t.substring(len - 1) == ')' ||
                 t.substring(len - 1) == 't' || t.substring(len - 1) == '+' || t.substring(len - 1) == '-' || t.substring(len - 1) == '*' ||
                 t.substring(len - 1) == '/' || t.substring(len - 1) == '^' || t.substring(len - 1) == '.';
             if(one_check){
               expression.text = t.substring(0, len - 1);
             }
             else if(t.substring(len - 2) == 'PI'){
               expression.text = t.substring(0, len - 2);
             }
             else if(len > 2){
               expression.text = t.substring(0, len - 3);
             }
           },
           splashColor: Appdata.bgcolor,
           child: const Icon(Icons.backspace, color: Color.fromRGBO(180, 180, 180, 1),)
       )
   ),
];
 var Row3 = <Widget>[
   const Spacer(flex: 1,),
   const TextKey(
     text: 't',
     width: 60,
   ),
   const TextKey(
     text: '0',
     width: 65,
   ),
   const TextKey(
     text: '1',
     width: 65,
   ),
   const TextKey(
     text: '2',
     width: 65,
   ),
   const TextKey(
     text: '3',
     width: 65,
   ),
   const TextKey(
     text: '4',
     width: 65,
   ),
   const Spacer(flex: 1,),];
 var Row4 = <Widget>[
   const Spacer(flex: 1,),
   const TextKey(
     text: '5',
     width: 65,
   ),
   const TextKey(
     text: '6',
     width: 65,
   ),
   const TextKey(
     text: '7',
     width: 65,
   ),
   const TextKey(
     text: '8',
     width: 65,
   ),
   const TextKey(
     text: '9',
     width: 65,
   ),
   const TextKey(
     text: '.',
     width: 40,
   ),
   const Spacer(flex: 1,),
 ];



class TextKey extends StatelessWidget {

  static double height = 40;
  const TextKey({super.key,
    required this.text,
    this.width = 70
  });
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appdata.keybgcolor,
      width: width*factor,
      height: 40*factor,
      padding: const EdgeInsets.all(1.5),
      child: FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7))
        ),
        backgroundColor: Appdata.bgcolor,
        onPressed: () {
          expression.text = '${expression.text}$text';
        },
          splashColor: Appdata.bgcolor,
        child: Text(text, style: Appdata.styl)
      )
    );
  }
}