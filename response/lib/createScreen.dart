import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'InputSigScreen.dart';



class Create{
  static var appbar = PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Appdata.barcolor,
      title: const Text('Create Signal', style: Appdata.funcstyle,),
    ),
  );
  static var flag1 = 0;
  static final TextEditingController signame = TextEditingController();
  static final TextEditingController fsdata = TextEditingController();
  static var namebox = SizedBox(
    width: 300,
    child: TextField(
      controller: Create.signame,
      onChanged: (str)=>{
        print(Create.signame.text),
      },
      style: Appdata.styl,
      decoration: const InputDecoration(
          labelText: 'Name of Signal',
          labelStyle: Appdata.styl,
          filled: true,
          fillColor: Appdata.bgcolor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          )
      ),
    ),
  );
  static var fsbox = SizedBox(
    width: 70,
    child: TextField(
      controller: Create.fsdata,
      style: Appdata.styl,
      decoration: const InputDecoration(
          labelText: 'Fs',
          labelStyle: Appdata.styl,
          filled: true,
          fillColor: Appdata.bgcolor,
          enabledBorder : OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          )
      ),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
        onChanged: (str)=>{
          print(Create.fsdata.text),
        }
    ),
  );
  static var addtspan;
  static
  List<Widget> tiles = [addtspan,];
}


class CreateScreen extends StatefulWidget{
  const CreateScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateScreen();
}


class _CreateScreen extends State<CreateScreen>{


  @override
  Widget build(BuildContext context){
      Create.addtspan = InkWell(
        child: ListTile(
        leading: const Icon(
          Icons.add, size: 30, color: Color.fromRGBO(150, 150, 150, 1),),
        title: const Text('Add time span', style: Appdata.styl),
        onTap: () => {
          // InputSignal.dialogBuilder(context)
          if(Create.signame.text.isEmpty){
            emptynameDialouge(context)
          }
          else if(Create.fsdata.text.isEmpty){
            emptyfsDialouge(context)
          }
          else{
            InputSignal.dialogBuilder(context)
          }
        },

        hoverColor: const Color.fromRGBO(0, 21, 27, 1.0),
        ),
      );

      var col = Column(children: Create.tiles,);

      var scrl = SingleChildScrollView(child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0),
        child: col,
      ),
      );
      var bodycontainer = Column(
        children: [
          Spacer(flex:10),
          Row(
            children: [
              Spacer(flex: 2),
              Create.namebox,
              Spacer(flex: 5),
              Text('Sampling Frequency : ', style: Appdata.styl,),
              Spacer(flex: 1),
              Create.fsbox,
              Spacer(flex: 10),
            ],
          ),
          Spacer(flex: 10,),
          scrl,
          Spacer(flex: 300,),
        ],
      );

    return Scaffold(
      appBar: Create.appbar,
      backgroundColor: Appdata.bgcolor,
      body: bodycontainer,
    );
  }
}

Future emptynameDialouge(BuildContext context) {
return showDialog(
context: context,
builder: (BuildContext context) {
return const AlertDialog(
  title: Center(
    child: Text('Signal Name Required !', style: TextStyle(
        color: Color.fromRGBO(150, 150, 150, 1),
        fontFamily: 'Calibre Light',
        fontSize: 24,
        fontWeight: FontWeight.w500),),
  ),
  backgroundColor: Appdata.bgcolor,
);
});
}

Future emptyfsDialouge(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Center(
            child: Text('Sampling Frequency Required !', style: TextStyle(
                color: Color.fromRGBO(150, 150, 150, 1),
                fontFamily: 'Calibre Light',
                fontSize: 24,
                fontWeight: FontWeight.w500),),
          ),
          backgroundColor: Appdata.bgcolor,
        );
      });
}