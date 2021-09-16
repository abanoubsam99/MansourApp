import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mansourapp/features/WelcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  // String _tokin;
  // bool _isSAdmin;
  // _checkCurentUser() async{
  //   SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
  //   setState(() {
  //     _tokin =_sharedPreference.get("UserToken");
  //     _isSAdmin =_sharedPreference.get("isAdmin");
  //
  //   });
  // }
  @override
  void initState() {
    //_checkCurentUser();
    Timer(Duration(seconds: 5), () {
      // if(_tokin!=null){
      //   print(_tokin);
      //   print(_isSAdmin);
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => HomePage(isAdmin: _isSAdmin)));
      // }
      // else{
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      // }
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });

    // Start full screen
    SystemChrome.setEnabledSystemUIOverlays([]);

    super.initState();
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/image/Splash.png",fit: BoxFit.fill,)),
        
        Center(
          child: Container(
            width: 240,
            height: 222,
            decoration: BoxDecoration(
              borderRadius: 
                BorderRadius.circular(500),
              color: Colors.white.withOpacity(.4),
            ),
          ),),

        Center(
          child: Image.asset("assets/image/logo.png"))
      ],),
    );

  }
}
