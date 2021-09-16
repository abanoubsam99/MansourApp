import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mansourapp/features/ProductDetails/ProductDetailsScreen.dart';
class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int _selectedCategory = 0;
  int columnCount = 1;
  @override
  void initState() {
    dataCategory=[
      {'title': "الكل", 'isSelected': true,"image":"https://image.freepik.com/free-photo/light-lamp-decor-glowing_1339-3091.jpg"},
      {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://img.freepik.com/free-photo/group-fashionable-modern-illuminated-chandeliers-dark-room-luxury-hanging-ceiling-lights_245047-873.jpg?size=626&ext=jpg"},
      {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://img.freepik.com/free-photo/vintage-lighting-decor-filtered-image-processed-vintage-effe_1232-3037.jpg?size=338&ext=jpg"},
      {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://image.freepik.com/free-photo/beautiful-light-lamp-decor-glowing_1339-7082.jpg"},
      {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://img.freepik.com/free-photo/chandelier-light-art-design-abstract_53876-14169.jpg?size=338&ext=jpg"},
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataCategory.length,
              padding: EdgeInsets.all(5),
              itemBuilder: (ctx, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent
                  ,highlightColor: Colors.transparent,
                  onTap: (){
                    setState(() {
                      dataCategory[_selectedCategory]['isSelected'] = false;
                      _selectedCategory = index;
                      dataCategory[_selectedCategory]['isSelected'] = true;

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: dataCategory[index]['isSelected']? Theme.of(context).primaryColor:Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: dataCategory[index]['isSelected']?Theme.of(context).primaryColor:Colors.grey)
                          ),
                          child: Center(
                              child:  dataCategory[index]['isSelected']?Image.asset("assets/image/chandelierwhite.png",width: 40,height: 40,):Image.asset("assets/image/chandelier.png",width: 40,height: 40,)
                          ),
                        ),

                        Center(
                          child: Text(dataCategory[index]['title'],style: TextStyle(color:  dataCategory[index]['isSelected']?Theme.of(context).primaryColor:Colors.black),),)

                      ],
                    ),
                  ),
                );
              }),
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
                return   AnimationConfiguration.staggeredGrid(
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
                                  image: DecorationImage(image: NetworkImage(dataCategory[_selectedCategory]['image']),fit: BoxFit.cover),
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
      ],),
    );
  }
}
List<Map<String, dynamic>> dataCategory = [
  {'title': "الكل", 'isSelected': true,"image":"https://image.freepik.com/free-photo/light-lamp-decor-glowing_1339-3091.jpg"},
  {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://img.freepik.com/free-photo/group-fashionable-modern-illuminated-chandeliers-dark-room-luxury-hanging-ceiling-lights_245047-873.jpg?size=626&ext=jpg"},
  {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://img.freepik.com/free-photo/vintage-lighting-decor-filtered-image-processed-vintage-effe_1232-3037.jpg?size=338&ext=jpg"},
  {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://image.freepik.com/free-photo/beautiful-light-lamp-decor-glowing_1339-7082.jpg"},
  {'title':"نجف مودرن باسكيت",'isSelected': false,"image":"https://img.freepik.com/free-photo/chandelier-light-art-design-abstract_53876-14169.jpg?size=338&ext=jpg"},
];