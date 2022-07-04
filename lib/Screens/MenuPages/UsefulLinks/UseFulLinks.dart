import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazvaxti0521/Screens/MenuPages/UsefulLinks/LinkTilel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../Constants.dart';


class UsefulLinks extends StatelessWidget {
  var _tileWidget = [
    LinkTile(name: "www.namazvaxti.org", path: "www.namazvaxti.org", subtitle: "Azərbaycan üçün Namaz Vaxtları"),
    LinkTile(name: "www.bizimislam.com", path:"www.bizimislam.com", subtitle: "Dini Kitablar"),
    LinkTile(name:"www.veraislam.ru", path:"www.veraislam.ru", subtitle:"Rusca - Dini Mövzular və Sual-Cavab"),
    LinkTile(name:"www.namazvakti.com", path:"www.namazvakti.com",subtitle: "Bütün ölkələrin namaz vaxtları"),
    LinkTile(name:"www.islamicbooksforfree.com",path: "www.islamicbooksforfree.com", subtitle:"Fərqli Dillərdə  Dini Kitablar"),
    LinkTile(name:"www.booksonhook.com", path:"www.booksonhook.com", subtitle:"Fərqli Dillərdə  Dini Kitablar"),
    LinkTile(name:"www.askidakitap.net", path:"www.askidakitap.net", subtitle:"Fərqli Dillərdə  Dini Kitablar")


  ];

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    var _h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Constants().scaffolColor,
      appBar: AppBar(
        title: Text("Dini Kitablar"),
      ),
      body: AnimationLimiter(
        child: ListView.builder(

          padding: EdgeInsets.all(_w / 30),
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: _tileWidget.length,
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
                  child: _tileWidget[index]
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}


