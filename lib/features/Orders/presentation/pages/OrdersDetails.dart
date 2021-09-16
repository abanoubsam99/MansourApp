import 'package:flutter/material.dart';
class OrdersDetails extends StatefulWidget {
  @override
  _OrdersDetailsState createState() => _OrdersDetailsState();
}

class _OrdersDetailsState extends State<OrdersDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: Image.asset("assets/image/logo.png",width: 120,height: 50,),
          centerTitle: true,
          leading:  Text("تم الاستلام",style: TextStyle(color: Colors.teal),textAlign: TextAlign.center,),
          actions:[
            IconButton( icon: Icon(Icons.arrow_back_ios,color: Colors.black,textDirection: TextDirection.ltr,),onPressed: (){
              Navigator.pop(context);
            },),
          ]
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [
                  Image.asset("assets/image/box.png",width: 30,height: 30,),
                  SizedBox(width: 10,),
                  Text("رقم الفاتورة:  120"),
                ],),
                Row(children: [
                  Text("تارخ الطلب: ",style: TextStyle(color:Colors.black),),
                  Text("20/10/2021",style: TextStyle(color: Theme.of(context).primaryColor),),
                ],)
              ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text("تارخ الاستلام: ",style: TextStyle(color:Colors.black),),
              Text("30/10/2021",style: TextStyle(color: Colors.teal),),
            ],),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                padding: EdgeInsets.all(5),
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.2, .2), //(x,y)
                              blurRadius: 2.0,
                            ),
                          ]
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/white-lightning-balls-modern-art-luxury-chandelier-made-with-balls-with-lamp-inside-every-one-which_152904-10306.jpg")
                                ,fit: BoxFit.cover)
                            ),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              width: 250
                              ,child: Text("ابليك مودرن باسكيت ذهبى موديل رقم 9061",style: TextStyle(color:Colors.black,fontSize: 15),textAlign: TextAlign.center,)),
                            Text("الكمية: 10 ",style: TextStyle(color:Colors.black)),

                          ],)
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],),
      ),
    );
  }
}
