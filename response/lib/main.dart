import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'HomeScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'createScreen.dart';
import 'dart:io' show Platform;
import 'package:window_manager/window_manager.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows || Platform.isMacOS || Platform.isLinux){
    WindowManager.instance.setFullScreen(false);
    WindowManager.instance.setResizable(false);
    WindowManager.instance.setTitle("Response");
  }
  runApp(const Response());
}

class Appdata{
  static const title = 'response';
  static const titlestyle = TextStyle(color: Color.fromRGBO(180, 180, 180, 1.0),
      fontFamily: 'Bookman Old Style',
      fontSize: 35,
      fontWeight: FontWeight.w400);
  static const funcstyle = TextStyle(color: Color.fromRGBO(180, 180, 180, 1.0),
      fontFamily: 'bookman old style',
      fontSize: 25,
      fontWeight: FontWeight.w400);
  static const menustyle = TextStyle(color: Color.fromRGBO(48, 166, 188, 1.0),
      fontFamily: 'Bookman Old Style',
      fontSize: 27,
      fontWeight: FontWeight.w300);
  static const textstyle = TextStyle(color: Color.fromRGBO(20, 170, 150, 1.0),
      fontFamily: 'Calibri Light',
      fontSize: 20,
      fontWeight: FontWeight.w400);
  static const styl = TextStyle(
      color: Color.fromRGBO(186, 186, 186, 1.0),
      fontFamily: 'Calibri Light',
      fontSize: 20,
      fontWeight: FontWeight.w400);

  static const bgcolor = Color.fromRGBO(0, 30, 38, 1.0);
  static const keybgcolor = Color.fromRGBO(5, 26, 32, 1.0);
  static const barcolor = Color.fromRGBO(0, 12, 21, 1.0);
  static const menucolor = Color.fromRGBO(0, 12, 20, 1.0);

}


class Response extends StatelessWidget {
  const Response({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Appdata.title,
        home:
        AnimatedSplashScreen(
          duration: 500,
          splash: Center(child: Text('Response', style: Appdata.titlestyle)),
          nextScreen: const HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Appdata.bgcolor,
        ),
    );
  }
}
