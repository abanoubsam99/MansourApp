import 'package:flutter/material.dart';
class LoginTextFild extends StatelessWidget {
   String hint;
   bool secure;
   IconData icon;
   TextInputType textInputType;
   Function  onclick;
  TextEditingController textEditingController;
  String _errorMessage(String error) {
    switch (hint) {
      case "اسم المستخدم/رقم التليفون":
        return "يجب كنابة اسم المستخدم او رقم التليفون";
           case "كلمة المرور":
        return "يجب كنابة كلمة المرور";
    }
    return hint;
  }
  LoginTextFild({@required this.textEditingController,@required this.hint,@required this.secure,@required this.icon, @required this.textInputType,@required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width-30,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return _errorMessage(hint);
              }
            },
            onSaved: onclick,
            obscureText: secure,
            keyboardType: textInputType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(.7),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                borderSide: BorderSide(
                  color:Theme.of(context).primaryColor,
                ),
              ),
              focusedErrorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                borderSide: BorderSide(
                  color:Theme.of(context).primaryColor,
                ),
              ) ,
             // labelText: hint,
              hintText: "اكتب "+hint,
              prefixIcon: Icon(icon,color: Theme.of(context).primaryColor,),
              hintStyle:  TextStyle(color: Colors.grey,fontSize: 17),
              labelStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 12,fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                borderSide: BorderSide(
                    color:Colors.black.withOpacity(.5)
                ),
              ),

            ),
            style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17),
            controller: textEditingController,
          ),
        ),
      ),
    );
  }
}
