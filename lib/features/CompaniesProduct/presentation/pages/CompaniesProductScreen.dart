import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mansourapp/features/ProductDetails/ProductDetailsScreen.dart';
class CompaniesProductScreen extends StatefulWidget {
  @override
  _CompaniesProductScreenState createState() => _CompaniesProductScreenState();
}

class _CompaniesProductScreenState extends State<CompaniesProductScreen> {
  int columnCount = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Image.asset("assets/image/logo.png",width: 120,height: 50,),
        centerTitle: true,
        leading: IconButton( icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("اسم الشركة ",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                Text("_________________",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),],),
          ),
          Expanded(
            child: AnimationLimiter(
              child: GridView.builder(
                itemCount:20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (ctx, index) {
                  return  AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: columnCount,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
                          },
                          child: Column(
                              children: [
                                Container(
                                  width: 166,
                                  height:184,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-vector/led-lightbulb-background_1284-8818.jpg"),fit: BoxFit.cover),
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
                  );
                },
              ),
            ),
          ),
        ],
      ),


    );
  }
}