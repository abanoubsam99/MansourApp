import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mansourapp/features/Companies/presentation/pages/CompaniesScreen.dart';
import 'package:mansourapp/features/CompaniesProduct/presentation/pages/CompaniesProductScreen.dart';
import 'package:mansourapp/features/LatestProducts/presentation/pages/LatestProductsScren.dart';
import 'package:mansourapp/features/MostWatched/presentation/pages/MostWatchedScreen.dart';
import 'package:mansourapp/features/ProductDetails/ProductDetailsScreen.dart';
class HomeScreen extends StatefulWidget {
  int index;
  HomeScreen(this.index);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  GlobalKey<ScaffoldState> _scaffoldKey;
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
      Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                items: imgList
                    .map((item) => Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        width:MediaQuery.of(context).size.width ,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black.withOpacity(.2),
                      ),
                      Positioned(
                        top: 0.0,
                        right: 50.0,
                        bottom: 0.0,
                        child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "شركة محمد ابراهيم",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "اسم يعني الثقة",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        bottom:10,
                        left: 0,
                        right: 0,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                    (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : _current == entry.key ? Theme.of(context).primaryColor : Colors.white )
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ))
                    .toList(),
                carouselController: _controller,
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
              ),
            ),
          ),
        ],
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
                    Text("اخر المنتجات",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                    Text("_________________",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),],),
              ),
              SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => LatestProductsScreen()));
                },child: Text("شاهد الكل ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
              ),

            ],),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: AnimationLimiter(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, i) {
                  return  AnimationConfiguration.staggeredList(
                    position: i,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: InkWell(
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
                                      image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/lamp-interior-ceiling-royal-light_1203-4884.jpg?size=338&ext=jpg&ga=GA1.2.1222716340.1631197339"),fit: BoxFit.cover),
                                    ),
                                  ),

                                  Container(
                                    width: 132,
                                      child: Text("دلايه ليد مودرن رباعيه بنى موديل رقم 10835//4 لوجيك",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),)),

                                ]
                            ),
                          ),
                        ),
                      ),
                    ),
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
                    Text("الأكثر مشاهدة",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                    Text("__________________",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),],),
              ),
              SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MostWatchedScreen()));
                },child: Text("شاهد الكل ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
              ),

            ],),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: AnimationLimiter(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, i) {
                  return AnimationConfiguration.staggeredList(
                  position: i,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                  verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: InkWell(
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
                                    image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/wire-black-design-ceiling-luster-hanging-bedroom-loft-interior-details_8353-8242.jpg?size=338&ext=jpg"),fit: BoxFit.cover),
                                  ),
                                ),

                                Container(
                                    width: 132,
                                    child: Text("ابليك مودرن باسكيت ذهبى موديل رقم 9013",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),)),

                              ]
                          ),
                        ),
                      ),
                    ),)
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
                    Text("الشركات",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                    Text("______________",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),],),
              ),
              SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CompaniesScreen()));
                },child: Text("شاهد الكل ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
              ),

            ],),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CompaniesProductScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 238,
                      height:107,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/millennial-asia-businessmen-businesswomen-meeting-brainstorming-ideas-about-new-paperwork-project-colleagues-working-together-planning-success-strategy-enjoy-teamwork-small-modern-night-office_7861-2386.jpg?size=338&ext=jpg"),fit: BoxFit.cover),
                      ),
                    ),
                  ),
                );
              }),
        ),

        SizedBox(height: 10,)





      ],),
    );
  }
}
final List<String> imgList = [
  'https://image.freepik.com/free-photo/engineer-man-testing-optical-fiber_23-2148323460.jpg',
  'https://img.freepik.com/free-photo/electricians-hands-testing-current-electric-control-panel_34936-1561.jpg?size=338&ext=jpg',
  'https://img.freepik.com/free-photo/electrical-engineer-using-digital-multi-meter-checking-electric-current-voltage-circuit-breaker_101448-1293.jpg?size=338&ext=jpg',
  'https://image.freepik.com/free-photo/engineer-checking-air-handling-unit-ahu-starter-button-control-panel-system_101448-2754.jpg',
  'https://img.freepik.com/free-photo/green-energy-with-hand-holding-environmental-light-bulb-background_53876-124630.jpg?size=338&ext=jpg',
  'https://img.freepik.com/free-photo/electrical-technician-working-switchboard-with-fuses_169016-5509.jpg?size=338&ext=jpg'
];
