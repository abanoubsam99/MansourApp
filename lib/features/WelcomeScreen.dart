import 'package:flutter/material.dart';
import 'package:mansourapp/features/HomePage/presentation/pages/HomePage.dart';
import 'package:mansourapp/features/Login/presentation/pages/LoginScreen.dart';
import 'package:mansourapp/features/SignUp/presentation/pages/SignUpScreen.dart';
class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/image/Splash.png",fit: BoxFit.cover,)),

        ListView(children: [
          SizedBox(height: 50,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: Stack(children: [
              Center(
                child: Container(
                  width: 164,
                  height: 149,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(100),
                    color: Colors.white.withOpacity(.4),
                  ),
                ),),
              Center(
                  child: Image.asset("assets/image/logo.png",width:150 ,height:70 ,))
            ],),
          ),
          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.4)
                ),child: Center( child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontSize:20 ),),),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Center(child: InkWell(onTap:  (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }, child: Text("تخطي",style: TextStyle(color: Colors.white,fontSize:15 ),),)),
          SizedBox(height: 25,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.4)
                ),child: Center( child: Text("انشاء حساب",style: TextStyle(color: Colors.white,fontSize:20 ),),),
              ),
            ),
          ),

        ],),

      ],)
    );
  }
}
