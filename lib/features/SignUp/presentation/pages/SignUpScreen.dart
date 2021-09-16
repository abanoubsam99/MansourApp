import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansourapp/Color.dart';
import 'package:mansourapp/features/HomePage/presentation/pages/HomePage.dart';
import 'package:mansourapp/features/Login/presentation/pages/LoginScreen.dart';
import 'package:mansourapp/features/SignUp/presentation/widgets/SignUpTextFild.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   String _email,_name,_password,_phone,_passwordHA256;
  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phone=TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   void ConvertToSHA256(String password){
     var bytes = utf8.encode(password);
     Digest sha256Result = sha256.convert(bytes);
     _passwordHA256=sha256Result.toString();
     print('SHA256: $sha256Result');
   }

   // SignupBloc _bloc;
   // @override
   // void initState() {
   //   _bloc=BlocProvider.of<SignupBloc>(context);
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
                        height: MediaQuery.of(context).size.height/3-20,
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
                      Center(child: Text("انشاء حساب",style: TextStyle(color: Colors.white,fontSize: 20,),),),
                      SignupTextFild(
                          textEditingController: name,
                          icon: Icons.person_outline,
                          hint: "اسم المستخدم",
                          secure: false,
                          onclick: (value) {  _name = value;},
                          textInputType:  TextInputType.text
                      ),
                      SignupTextFild(
                          textEditingController: email,
                          icon: Icons.email_outlined,
                          hint: "البريد الالكترونى",
                          secure: false,
                          onclick: (value) {  _email = value;},
                          textInputType:  TextInputType.emailAddress
                      ),
                      SignupTextFild(
                          textEditingController: phone,
                          icon: Icons.phone,
                          hint: "رقم التليفون",
                          secure: false,
                          onclick: (value) {  _phone = value;},
                          textInputType:  TextInputType.phone
                      ),
                      SignupTextFild(
                          textEditingController: password,
                          icon: Icons.lock,
                          hint: "كلمة المرور",
                          secure: true,
                          onclick: (value) {  _password = value;},
                          textInputType:  TextInputType.visiblePassword
                      ),
                      SizedBox(height: 15,),

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
                        ),child: Center(child: Text("انشاء حساب",style: TextStyle(color: Colors.white,fontSize: 20,),),),
                      ),
                      ),
                      SizedBox(height: 10,),

                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: InkWell(
                          onTap: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("لديك حساب بالفعل ؟",style: TextStyle(color: Colors.white,fontSize: 15,),),
                              Text("  تسجيل  الدخول",style: TextStyle(color: Color(getColorHexFromStr("#F18282")),fontSize: 15,),)
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
