import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mansourapp/Color.dart';
import 'package:mansourapp/features/ProductDetails/AllProduct.dart';
import 'package:share/share.dart';
class ProductDetailsScreen extends StatefulWidget {

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int counter=1;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final _random = new Random();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*2/5,
              child:  CarouselSlider(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    //aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: imgList
                    .map((item) => Container(
                  child: Center(
                      child: Image.network(
                       item,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      )),
                ))
                    .toList(),
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: IconButton(icon:Icon( Icons.arrow_back_ios,color: Colors.white,textDirection: TextDirection.ltr,),
                onPressed: (){
                  Navigator.pop(context);
                }

            )),
            Positioned(
                top: 10,
                right: 10,
                child: IconButton(icon:Icon( Icons.share,color: Colors.white,textDirection: TextDirection.ltr,),
                    onPressed: (){
                      Share.share("state.featuredstoresModel.url", subject: "state.featuredstoresModel.name");
                    }

                )),
            Positioned(
              top: MediaQuery.of(context).size.height*2/5-50 ,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*2/5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50) )
                ),child: Column(children: [
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text("دلايه ثلاثيه معدن شكل قمع اسود×نحاسى مصرى الهلال",style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
                  ),
                Expanded(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("المواصفات",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),textAlign: TextAlign.right,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ListView.separated(
                            separatorBuilder: (_, __) => Divider(),
                            scrollDirection: Axis.vertical,
                            itemCount: 4,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  Text("النوع: "),
                                  Text("دلايه ثلاثيه معدن شكل الجرس"),
                                ],
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("منتجات مشابهة",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                              ],),
                          ),
                          SizedBox(width: 20,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(onPressed: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => AllProduct()));
                            },child: Text("شاهد الكل ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
                          ),
                        ],),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 230,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                      Container(
                                        width: 132,
                                        height:149,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/wedding-cake-decor-made-two-rocking-chairs_8353-1725.jpg"),fit: BoxFit.cover),
                                        ),
                                      ),

                                      Container(
                                          width: 132,
                                          child: Text("ابليك مودرن باسكيت ذهبى موديل رقم 9013",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),)),

                                    ]
                                ),
                              ),
                            );
                          }),
                    ),
                  ],),
                ),

                Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 200,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Text("اضف للسلة",style: TextStyle(color: Colors.white),),
                          Icon(Icons.add_shopping_cart,color: Colors.white,),

                        ],),
                      ),
                    ),

                    Row(children: [
                      InkWell(
                        onTap:(){
                          setState(() {
                            counter++;

                          });
                          }
                        ,child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context).primaryColor
                          ),
                          child: Center(child: Text("+",style: TextStyle(color: Colors.white,fontSize: 25),),),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(counter.toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          if(counter>1){
                            setState(() {
                              counter--;
                            });
                          }
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).primaryColor
                          ),
                          child: Center(child: Text("-",style: TextStyle(color: Colors.white,fontSize: 25),),),
                        ),
                      ),
                    ],)

                  ],),
                )

              ],),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
final List<String> imgList = [
  'https://image.freepik.com/free-photo/luxury-restaurant-grill-bar-interior-with-chandeliers-furniture_114579-2341.jpg',
  'https://image.freepik.com/free-vector/realistic-vintage-light-bulbs-brick-wall-illustration_1284-55758.jpg',
  'https://img.freepik.com/free-photo/3d-rendering-modern-dining-room-living-room-with-luxury-decor_105762-1934.jpg?size=338&ext=jpg',
  'https://img.freepik.com/free-photo/large-golden-chandelier-variegated-ceiling-with-islamic-traditional-religious-ornament_169016-10741.jpg?size=338&ext=jpg',
  'https://img.freepik.com/free-photo/luxurious-dinner-hall-with-large-crystal-chandelier_8353-565.jpg?size=338&ext=jpg',
  'https://image.freepik.com/free-photo/beautiful-light-lamp-decoration_1339-7080.jpg'
];
