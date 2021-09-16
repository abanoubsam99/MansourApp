import 'package:flutter/material.dart';
class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(child: Image.asset("assets/image/aboutus.png")),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("شركة محمد ابراهيم",style: TextStyle(color: Colors.black,fontSize: 20,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("تأسست شركه منصور لتجاره وتوزيع الأدوات الكهربائية والمعروفة بشركه ( محمد إبراهيم ) نسبه لصاحبها عام 1995 في مدينه المحلة الكبرى وبفضل الله وتوفيقه نجحت الشركة على مر السنين في التحول إلى واحده من ابرز الشركات التجارية اللاعبة في السوق المصري في مجال بيع وتوزيع المنتجات الكهربائية وتتميز الشركة بتقديم باقة متكاملة من منتجات الأدوات الكهربائية المحلية والمستوردة في مكان واحد حيث نتعامل مع كبرى الشركات المستوردة والمصنعة المتخصصة في هذا المجال ومن أبرزها ( السويدي للكابلات – تتشينو - شنايدر – شنت - فينوس- فيونا- هوهو- توشيبا – فريش – بريفكس -حجازى ستار- فلكس- الوسام - إليوس - المهندسين للكابلات – أفينا -ينى ستار- امكو- عز العرب ........ الخ وترتكز استراتيجيه الشركة على تقديم اكبر تشكيله من أصناف الأدوات الكهربائية من مرحله التأسيس حتى التشطيب وتلبيه طلبات العملاء وتغطيه خدماتنا لتجار الجملة والموزعين والمقاولين على مستوى الجمهورية بسيارات الشركة من الإسكندرية حتى أسوان وتلتزم الشركة فى عملها بالتحلي بأخلاقيات الأمانة والنزاهة والشفافية وبيع المنتجات الأصلية فقط والبعد عن المنتجات المقلدة وتقديم خدمه مميزه وسريعه من خلال فريق عمل يتميز بالخبرة والاحترافية ملتزما بقيم التواضع والاحترام للآخرين"
            ,style: TextStyle(color: Colors.black,fontSize: 13),),
        ),
      ],),
    );
  }
}
