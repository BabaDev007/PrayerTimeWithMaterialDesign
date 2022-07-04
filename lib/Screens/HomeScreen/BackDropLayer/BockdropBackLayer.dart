import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazvaxti0521/Screens/MenuPages/AboutPrayerTimes/AboutPrayerTimes.dart';
import 'package:namazvaxti0521/Screens/MenuPages/GiveQuestion/GiveQuestion.dart';
import 'package:namazvaxti0521/Screens/MenuPages/Movies/MovieTile.dart';
import 'package:namazvaxti0521/Screens/MenuPages/UsefulLinks/UseFulLinks.dart';
import '../../MenuPages/Esmail_Husna/EsmaScreen.dart';
import '../../MenuPages/Feedback/FeedbackPage.dart';
import '../../MenuPages/KompassScreen/qiblah_compass.dart';
import '../../MenuPages/Share/Share.dart';
import 'MenuListTile.dart';

class BackDropLayerContent extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    var _h = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: _w/9, vertical: _h/30),
      physics: BouncingScrollPhysics(),


      children: [
        MenuListTile(icon: Icon(Icons.abc) , title: "Esmail-Hüsna",widget: EsmaScreen(),),
        MenuListTile(icon: Icon(Icons.abc) , title: "Esmail-Hüsna",widget: EsmaScreen(),),
        MenuListTile(icon: Icon(Icons.movie_creation_outlined), title: "Dini Filmlər",widget: Movies(),),
        MenuListTile(icon: Icon(Icons.link), title: "Faydalı Keçidlər",widget: UsefulLinks(),),
        UrlLauncherTile(icon: Icon(Icons.question_answer_outlined), title: "Sual Göndər", path: 'https://form.jotform.com/203285791454461',),
        MenuListTile(icon: Icon(Icons.info), title: "Vaxtların Hesablanması",widget: AboutPrayerTimes(),),
        MenuListTile(icon: Icon(Icons.feedback_outlined), title: "Fikir Bildir",widget: FeedbackPage(),),
        MenuListTile(icon: Icon(Icons.info_outline_rounded), title: "Tətbiq Haqqında",widget: QiblahCompass(),),
        MenuListTileSHare(title: "Paylaş", icon: Icon(Icons.share_outlined))




      ]

    );
  }
}








