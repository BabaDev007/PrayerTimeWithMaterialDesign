import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../../Constants.dart';
import '../../../PaddingManager.dart';
import 'EsmailHusnaClass.dart';


class EsmaTile extends StatelessWidget {
final String isim;
final String anlam;
final int no;



  EsmaTile(this.isim, this.anlam, this.no );

  @override
Widget build(BuildContext context) {
  return Padding(
      padding: PaddingManager().prayerTimeWidgetPadding,

        child: Container(
          height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).errorColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.2),
                  blurRadius: 30,
                  offset: Offset(20, 30),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),


            child: ListTile(
              leading: Text("$no", style: Theme.of(context).textTheme.headline4,),
              title: Text(isim),
              subtitle: Text(anlam),

            )),
      );
}
}



class EsmaScreen extends StatefulWidget {

  @override
  State<EsmaScreen> createState() => _EsmaScreenState();
}

class _EsmaScreenState extends State<EsmaScreen> {
  final box = GetStorage();
  bool visible = true;
  void setVisible(){
    box.write("isVisible", visible);
  }
  bool getVisible(){
     return box.read("isVisible") ?? true;
  }

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants().scaffolColor,
      appBar: AppBar(

        title: Text("Esmaül-Hüsna"),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          AnimationLimiter(
            child: ListView.builder(

              padding: EdgeInsets.all(_w / 30),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: Esma.esmaTileListe.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: Duration(milliseconds: 80),
                  child: SlideAnimation(
                    duration: Duration(milliseconds: 1800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    horizontalOffset: 30,
                    verticalOffset: 300.0,
                    child: FlipAnimation(
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        flipAxis: FlipAxis.y,
                        child: Esma.esmaTileListe[index]
                    ),
                  ),
                );
              },

            ),
          ),
          Visibility(
            visible: getVisible(),
            child: Center(
              child:
                 SizedBox(
                   height: 500,
                   width: 400,
                   child: AlertDialog(
                     title: Text("Xatırlatma", textAlign: TextAlign.center,),
    content: Text("Hədis-i şərifdə, Esma-i hüsnayı mənası ilə birlikdə əzbərliyənin Cənnətə gedəcəyi bildirilmiştir", textAlign: TextAlign.center,), actions:[
                    Center(
                      child: TextButton(onPressed: (){
                        setState((){
                          visible = false;
                          setVisible();
                        });
                      }, child: Text("OK")),
                    )] ,),
                 ),

            ),
          ),
        ],
      ),
    );
  }
}
