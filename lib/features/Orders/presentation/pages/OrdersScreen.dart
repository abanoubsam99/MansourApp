import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mansourapp/Color.dart';
import 'package:mansourapp/features/Orders/presentation/pages/OrdersDetails.dart';
class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            padding: EdgeInsets.all(5),
            itemBuilder: (ctx, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 90,
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
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(children: [
                                  Image.asset("assets/image/box.png",width: 30,height: 30,),
                                  SizedBox(width: 10,),
                                  Text("رقم الفاتورة:  120"),
                                ],),
                              Text("20/10/2021",style: TextStyle(color: Theme.of(context).primaryColor),),
                            ],),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(width: 1,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => OrdersDetails()));
                                },
                                child: Container(
                                  width: 120,
                                  height:30 ,
                                  decoration: BoxDecoration(
                                    color: Color(getColorHexFromStr("#707070")).withOpacity(.15),
                                    borderRadius: BorderRadius.circular(5)
                                  ),child: Center(child: Text("التفاصيل",style: TextStyle(color: Colors.black),),),
                                ),
                              ),
                              Row(children: [
                                Text("تم الاستلام",style: TextStyle(color: Colors.teal),),
                                Image.asset("assets/image/checked.png",width: 20,height: 20,)
                              ],)
                            ],),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
