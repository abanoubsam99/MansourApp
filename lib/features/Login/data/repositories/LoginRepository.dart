import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mansourapp/AlertErrors/AlertErrorDialog.dart';
import 'package:mansourapp/MyConstants.dart';
import 'package:mansourapp/features/Login/data/models/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class LoginRepository {
  Future<LoginModel> LoginUser();

}
class LoginRepositoryImp extends LoginRepository
{
  @override
  Future<LoginModel> LoginUser({BuildContext context,String name, String password}) async {

    final response = await http.post(
        Uri.parse(MyConstants().urlBasic+"login"),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: {
          "name":name,
          "password":password,
        }
    );
    final data =json.decode(response.body);

    if (data['Result']==true) {
      // SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
      // _sharedPreference.setString("UserToken", data['token'].toString());
      // _sharedPreference.setString("id", data['id'].toString());
      // _sharedPreference.setString("image", data['image'].toString());
      // _sharedPreference.setString("name", data['name'].toString());
      // _sharedPreference.setString("email", data['email'].toString());

      print(response.body);
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             HomePage(isAdmin: data['isAdmin'])));
      return data;
    } else {
      print(response.body);
      showAlertErrorDialog(
          context:context,
          erorrtext: data['Errors'][0]['errorMSG']
      );
      print("Failed to Login album.");
    }
  }

}