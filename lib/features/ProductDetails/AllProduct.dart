import 'package:flutter/material.dart';
import 'package:mansourapp/features/ProductDetails/ProductDetailsScreen.dart';
class AllProduct extends StatefulWidget {
  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
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
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
            itemCount:20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (ctx, index) {
              return  InkWell(
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
                          image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/interiors-state-hermitage-museum-saintpetersburg-russia_380726-1125.jpg?size=338&ext=jpg"),fit: BoxFit.cover),
                        ),
                      ),

                      Container(
                          width: 132,
                          child: Text("دلايه ليد مودرن رباعيه بنى موديل رقم 10835//4 لوجيك",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),)),

                    ]
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
