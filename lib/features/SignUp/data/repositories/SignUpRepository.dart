import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mansourapp/AlertErrors/AlertErrorDialog.dart';
import 'package:mansourapp/MyConstants.dart';
import 'package:mansourapp/features/SignUp/data/models/SignUpModel.dart';

abstract class SignUpRepository {
  Future<SignUpModel> CreateUser();

}
class SignUpRepositoryImp extends SignUpRepository {
  @override
  Future<SignUpModel> CreateUser({BuildContext context,String name, String phone, String email, String password, String client}) async {

    final response = await http.post(
        Uri.parse(MyConstants().urlBasic+"register"),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: {
          'name': name,
          'phone': phone,
          "email":email,
          "password":password,
          "client":client
        }
    );
    final data =json.decode(response.body);

    if (data['Result']==true) {
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             LoginScreen()));
      return data;
    } else {
      print(response.body);
      showAlertErrorDialog(
        context:context,
        erorrtext: data['Errors'][0]['errorMSG']
      );
      print("Failed to create album.");
    }
  }

}