import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansourapp/Color.dart';
import 'package:mansourapp/features/HomePage/presentation/pages/HomePage.dart';
import 'package:mansourapp/features/Login/presentation/widgets/LoginTextFild.dart';
import 'package:mansourapp/features/SignUp/presentation/pages/SignUpScreen.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   String _name,_password,_passwordHA256;
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   // Group Value for Radio Button.
   int id = 0;
   void ConvertToSHA256(String password){
     var bytes = utf8.encode(password);
     Digest sha256Result = sha256.convert(bytes);
     _passwordHA256=sha256Result.toString();
     print('SHA256: $sha256Result');
   }
  //  LoginBloc _bloc;
  //  @override
  // void initState() {
  //    _bloc=BlocProvider.of<LoginBloc>(context);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/Splash.png"),fit: BoxFit.cover)),
                child:Column(
                  children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3+50,
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
                  Center(child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontSize: 20,),),),
                    SizedBox(height: 20,),
                    LoginTextFild(
                      textEditingController: name,
                      icon: Icons.person_outline,
                      hint: "اسم المستخدم/رقم التليفون",
                      secure: false,
                      onclick: (value) {  _name = value;},
                      textInputType:  TextInputType.text
                  ),
                    LoginTextFild(
                      textEditingController: password,
                      icon: Icons.lock,
                      hint: "كلمة المرور",
                      secure: true,
                      onclick: (value) {  _password = value;},
                      textInputType:  TextInputType.visiblePassword
                  ),
                    SizedBox(height: 20,),

                  InkWell(
                    onTap: (){
                        setState(() {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              /*
                              ConvertToSHA256(_password);
                              _bloc.add(LoginButtonPressed(
                                context: context,
                                name: _name,
                                pass: _passwordHA256,
                              ));
                              */
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                            } else {
                              print("Login validator error");
                            }
                          });
                    },child: Container(
                    width: MediaQuery.of(context).size.width-100,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.55),
                      borderRadius: BorderRadius.circular(50)
                    ),child: Center(child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontSize: 20,),),),
                  ),
                  ),
                    SizedBox(height: 20,),

                  Directionality(
                   textDirection: TextDirection.rtl,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("لا يوجد لديك حساب ؟",style: TextStyle(color: Colors.white,fontSize: 15,),),
                        Text("انشاء حساب",style: TextStyle(color: Color(getColorHexFromStr("#F18282")),fontSize: 15,),)
                      ],),
                    ),
                  )

                ],)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
