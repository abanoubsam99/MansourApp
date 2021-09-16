
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ConnectWithUsScreen extends StatefulWidget {
  @override
  _ConnectWithUsScreenState createState() => _ConnectWithUsScreenState();
}

class _ConnectWithUsScreenState extends State<ConnectWithUsScreen> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget ConnectItem({String image,String title,Function function}){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: function,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft:  Radius.circular(10),topRight:  Radius.circular(50),topLeft:  Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
            BoxShadow(
            color: Colors.grey,
            offset: Offset(0.2, .2), //(x,y)
            blurRadius: 2.0,
          ),
            ]
          ),
          child: Row(
            children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.2, .2), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ]
              ),child: Center(child: Image.asset(image,width: 45,height: 45,)),
            ),
            SizedBox(width: 10,),
            Container(
                width: 250,
                child: Text(title,style: TextStyle(color: Colors.black,fontSize: 14),textAlign: TextAlign.center,)),],),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ConnectItem(
          image:"assets/image/location.png" ,
          title:"المحلة - الزهراء" ,
          function:(){
            _launchMapsUrl(30.9720881,31.1826462);
         // _launchInWebViewWithJavaScript('https://www.google.com/maps/place/%D8%B4%D8%B1%D9%83%D9%87+%D9%85%D8%AD%D9%85%D8%AF+%D8%A7%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85+%D9%84%D8%AA%D8%AC%D8%A7%D8%B1%D9%87+%D8%A7%D9%84%D8%A7%D8%AF%D9%88%D8%A7%D8%AA+%D8%A7%D9%84%D9%83%D9%87%D8%B1%D8%A8%D8%A7%D8%A6%D9%8A%D9%87%E2%80%AD/@30.9707082,31.1860794,15z/data=!4m12!1m6!3m5!1s0x0:0xbf100e997d1fd7f1!2z2LTYsdmD2Ycg2YXYrdmF2K8g2KfYqNix2KfZh9mK2YUg2YTYqtis2KfYsdmHINin2YTYp9iv2YjYp9iqINin2YTZg9mH2LHYqNin2KbZitmH!8m2!3d30.970703!4d31.1860778!3m4!1s0x0:0xbf100e997d1fd7f1!8m2!3d30.970703!4d31.1860778');
          }
        ),
        ConnectItem(
            image:"assets/image/telephone.png" ,
            title:"01020203447" ,
            function:(){
              _makePhoneCall('tel:01020203447');
            }
        ),
        ConnectItem(
            image:"assets/image/email.png" ,
            title:"admin@mohamed-ibrahiem.com" ,
            function:(){
              launch('mailto:admin@mohamed-ibrahiem.com?subject=This is Subject Title&body=This is Body of Email');
            }
        ),
        ConnectItem(
            image:"assets/image/facebook.png" ,
            title:"شركه محمد ابراهيم لتجاره الادوات الكهربائيه" ,
            function:(){
              _openFacebook();
              //_launchInWebViewOrVC('https://www.facebook.com/mohammed.ibrahim.electronic/');
            }
        ),
        ConnectItem(
            image:"assets/image/whatsapp.png" ,
            title:"تحدث معنا الان " ,
            function:(){
              openwhatsapp();
            }
        ),
      ],),
    );
  }
  openwhatsapp() async{
    var whatsapp ="+201020203447";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));

      }

    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));

      }

    }

  }
  void _openFacebook() async{
    String fbProtocolUrl = "fb://page/107805348111279";
    String fallbackUrl = "https://www.facebook.com/mohammed.ibrahim.electronic";
    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);
      print("launching..."+fbProtocolUrl);
      if (!launched) {
        print("can't launch");
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      print("can't launch exp "+e.toString());
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }
}

