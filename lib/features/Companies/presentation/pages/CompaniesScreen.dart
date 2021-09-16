import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mansourapp/features/CompaniesProduct/presentation/pages/CompaniesProductScreen.dart';
class CompaniesScreen extends StatefulWidget {
  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("الشركات",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                Text("_________________",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),],),
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimationConfiguration.staggeredList(
                        position: i,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => CompaniesProductScreen()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/big-city_1127-3102.jpg?size=338&ext=jpg"),fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

          ),
        ],
      ),
    );
  }
}
