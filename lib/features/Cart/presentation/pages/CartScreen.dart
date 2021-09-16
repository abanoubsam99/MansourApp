import 'package:flutter/material.dart';
import 'package:mansourapp/Color.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count=1;
  List<int> counter=[1,1,1,1,1];
  int itemNumber=5;
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
            actions:[
              IconButton( icon: Icon(Icons.arrow_back_ios,color: Colors.black,textDirection: TextDirection.ltr,),onPressed: (){
                Navigator.pop(context);
              },),
            ]
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itemNumber,
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
                      child: Stack(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Container(
                                width: 200,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("ابليك مودرن باسكيت ذهبى موديل رقم 9061",style: TextStyle(color:Colors.black,fontSize: 15),textAlign: TextAlign.center,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              counter[index]++;
                                            });
                                          },child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Theme.of(context).primaryColor
                                            ),
                                            child: Center(child: Text("+",style: TextStyle(color: Colors.white,fontSize: 25),),),
                                          ),
                                        ),
                                      Text(counter[index].toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
                                        InkWell(
                                          onTap: (){
                                            if(counter[index]>1){
                                              setState(() {
                                                counter[index]--;
                                              });
                                            }

                                          },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Theme.of(context).primaryColor
                                          ),
                                          child: Center(child: Text("-",style: TextStyle(color: Colors.white,fontSize: 25),),),
                                        ),
                                      ),
                                    ],)

                                  ],),
                              )
                            ],
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: InkWell(
                              onTap: (){
                                if(itemNumber>0){
                                  setState(() {
                                    itemNumber--;
                                  });
                                }

                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(getColorHexFromStr("#ECECEC")),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10) )
                                ),
                                child:Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset("assets/image/delete.png"),)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width-50,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(child: Text("اطلب الان ",style: TextStyle(color: Colors.white,fontSize: 20),),),

            ),
          )
        ],),
      ),
    );
  }
}
