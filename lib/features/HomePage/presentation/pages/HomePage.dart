import 'package:flutter/material.dart';
import 'package:mansourapp/features/AboutUs/AboutUsScreen.dart';
import 'package:mansourapp/features/Cart/presentation/pages/CartScreen.dart';
import 'package:mansourapp/features/ConnectWithUs/ConnectWithUsScreen.dart';
import 'package:mansourapp/features/HomeScreen/presentation/pages/HomeScreen.dart';
import 'package:mansourapp/features/Orders/presentation/pages/OrdersScreen.dart';
import 'package:mansourapp/features/Products/presentation/pages/ProductsScreen.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int _selectedDestination = 0;
  Widget drawerItem({Image image, String title, int index}){
    return ListTile(
      leading: image,
      title: Text(title,style: TextStyle(color: _selectedDestination == index?Theme.of(context).primaryColor:Colors.black,),),
      selected: _selectedDestination == index,
      onTap: () {
        selectDestination(index);
        Navigator.pop(context);
      } ,
    );
  }
  Widget drawerItem2({Image image, String title, int index}){
    return ListTile(
      leading: image,
      title: Text(title,style: TextStyle(color: _selectedDestination == index?Colors.white:Colors.white,),),
      selected: _selectedDestination == index,
      onTap: () {
        selectDestination(index);
        Navigator.pop(context);
      } ,
    );
  }
  List listbody=[HomeScreen(0),OrdersScreen(),AboutUsScreen(),ConnectWithUsScreen(),HomeScreen(4),ProductsScreen()];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Theme.of(context).accentColor,
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/7,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/image/drawerheader.png"),fit: BoxFit.fill)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 30,),
                    Image.asset("assets/image/logo.png",width:120 ,height: 55,),
                  ],
                ),
              ),
              drawerItem(
                  index: 0,
                  image: _selectedDestination ==0? Image.asset("assets/image/homered.png",width: 30,height: 30,): Image.asset("assets/image/home.png",width: 30,height: 30,),
                  title: "الرئيسية"
              ),
              drawerItem(
                  index: 1,
                  image:  _selectedDestination ==1?Image.asset("assets/image/notered.png",width: 30,height: 30,): Image.asset("assets/image/note.png",width: 30,height: 30,),
                  title: "الطلبات"
              ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text("اقسام المنتجات",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17,decoration: TextDecoration.underline),),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 20,
              itemBuilder: (context, i) {
                return drawerItem(
                    index: i+5,
                    image:  _selectedDestination ==i+5?Image.asset("assets/image/notered.png",width: 30,height: 30,): Image.asset("assets/image/note.png",width: 30,height: 30,),
                    title: "المنتج  "+(i+1).toString()
                );
              }),
        ),
              Padding(
                padding: const EdgeInsets.only(bottom:  2),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  color: Theme.of(context).primaryColor,
                  child: drawerItem2(
                      index: 2,
                      image: Image.asset("assets/image/information.png",width: 30,height: 30,),
                      title: "من نحن "
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:  2),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  color: Theme.of(context).primaryColor,
                  child: drawerItem2(
                      index: 3,
                      image: Image.asset("assets/image/call.png",width: 30,height: 30,),
                      title: "تواصل معنا"
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                color: Theme.of(context).primaryColor,
                child: ListTile(
                  leading: Image.asset("assets/image/logout.png",width: 30,height: 30,),
                  title: Text("تسجيل الخروج",style: TextStyle(color: _selectedDestination == 4?Colors.white:Colors.white,),),
                  selected: _selectedDestination == 4,
                  onTap: () {
                    selectDestination(4);
                    Navigator.pop(context);
                  } ,
                )
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: Image.asset("assets/image/logo.png",width: 120,height: 50,),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            _globalKey.currentState.openDrawer();

          }, icon: Icon(Icons.menu,color: Colors.black,size: 30,)),
          actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CartScreen()));

                    }
                ,child: Image.asset("assets/image/trolley.png",width: 30,height: 30,)),
              )
            ],
        ),

        body: _selectedDestination>=5?listbody[5]:listbody[_selectedDestination]
      ),
    );
  }
  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}