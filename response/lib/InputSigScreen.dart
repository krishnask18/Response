import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:response/main.dart';
import 'createScreen.dart';
import 'package:response/Keyboards.dart';
import 'package:function_tree/function_tree.dart';


TextEditingController time_i = TextEditingController();
TextEditingController time_f = TextEditingController();
TextEditingController expression = TextEditingController();
TextEditingController samples = TextEditingController();


class InputSignal{
  static TextField expr = TextField(
    showCursor: false,
    style: Appdata.styl,
  decoration: const InputDecoration(
  filled: false,
  labelText: 'Expression',
  labelStyle: Appdata.styl,
  fillColor: Colors.grey,
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(
  color: Colors.white
  )
  ),
  enabledBorder : OutlineInputBorder(
  borderSide: BorderSide(
  color: Colors.white
  )
  ),
  ),
  controller: expression,
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
    onTap: ()=>{
      tap()
    },
    onSubmitted: (String str)=>{
      untap()
    },

  );
  static Text samplen = Text("Samples : 0", style: Appdata.styl,);
  static var keyEnable;
  static var tap;
  static var untap;
  static var error;

  static checkExpr(String s, BuildContext context){
    try{
        print(s.replaceAll('t', '0').interpret());
        Navigator.of(context).pop();

    }catch(e){
      InputSignal.error();
    }
  }

  static Future dialogBuilder(context) {
    InputSignal.keyEnable = Text('');
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: Appdata.bgcolor,
        child : StatefulBuilder(
          builder:(BuildContext context, StateSetter setState){
            InputSignal.tap = ()=>{
              setState((){
                InputSignal.keyEnable = key.kb;
              })
            };
            InputSignal.untap = ()=>{
              setState((){
                InputSignal.keyEnable = const Text('');
              })
            };
            InputSignal.error = ()=>{
              setState((){
                InputSignal.keyEnable = const Text('Signal Expression in not valid!', style: Appdata.styl,);
              })
            };
            return Container(
              height: 440,
              width: 700,
              padding: const EdgeInsets.all(35),
              child: SizedBox(
                child: Center(
                  child: Column(
                    children: [
                      InputSignal.expr,
                      const Spacer(flex:2),
                      Row(
                        children: [
                          const Spacer(flex: 2,),
                          const Text('Timespan : ', style: Appdata.styl,),
                          const Spacer(flex: 2,),
                          SizedBox(width: 70 ,
                              child: TextField(
                                style: Appdata.styl,
                                controller: time_i,
                                decoration: const InputDecoration(
                                  filled: false,
                                  labelText: 'start',
                                  labelStyle: Appdata.styl,
                                  fillColor: Colors.grey,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white
                                      )
                                  ),
                                  enabledBorder : OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white
                                      )
                                  ),
                                ),
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
                                  onTap: ()=>{
                                      untap()
                                  },
                                  onChanged: (String str)=>{
                                    if(time_f.text.isNotEmpty||time_f.text.isNotEmpty){
                                      setState((){
                                        double a = ((double.parse(time_f.text) - double.parse(time_i.text))*(double.parse(Create.fsdata.text)));
                                        samplen = Text('Samples : ${(a.round())}', style: Appdata.styl,);
                                      })
                                    }
                                  }
                              ),),
                          const Spacer(flex: 2,),
                          SizedBox(width: 70,
                              child: TextField(
                                style: Appdata.styl,
                                controller: time_f,
                                onTap: ()=>{
                                    untap()
                                  },
                                onChanged: (String str)=>{
                                  if(time_f.text.isNotEmpty||time_f.text.isNotEmpty){
                                    setState((){
                                      double a = ((double.parse(time_f.text) - double.parse(time_i.text))*(double.parse(Create.fsdata.text)));
                                      samplen = Text('Samples : ${(a.round())}', style: Appdata.styl,);
                                    })
                                  }
                                },
                                decoration: const InputDecoration(
                                  filled: false,
                                  labelText: 'end',
                                  labelStyle: Appdata.styl,
                                  fillColor: Colors.grey,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white
                                      )
                                  ),
                                  enabledBorder : OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white
                                      )
                                  ),
                                ),
                              ),),
                          const Spacer(flex: 5,),
                        InputSignal.samplen,
                        const Spacer(flex: 2,),],
                      ),
                      Spacer(flex: 2,),
                      InputSignal.keyEnable,
                      Spacer(flex: 4,),
                      Row(
                        children: [
                          TextButton(
                            child: const Text('Cancel', style: Appdata.styl,),
                            onPressed: () {
                              time_i.text = '';
                              time_f.text = '';
                              expression.text = '';
                              Navigator.of(context).pop();
                            },
                          ),
                          Spacer(),
                          TextButton(
                            child: const Text('Add', style: Appdata.styl,),
                            onPressed: () {
                              InputSignal.checkExpr(expression.text, context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
        }
      ),
      );
    }
  );
}
}