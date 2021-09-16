import 'package:flutter/material.dart';

class MyConstants extends InheritedWidget {
  final   String urlBasic="http://192.168.0.201:8080/souq/";
  final   String imageUrlBasic="http://192.168.0.201:8080/souq/imag?id=";
  final   String defaultAvatarImage="https://souq-mahala.com/imag?id=3240";
  final   String defaulProducttimage="https://souq-mahala.com/imag?id=3246";

  @override
  bool updateShouldNotify(MyConstants oldWidget) => false;
}