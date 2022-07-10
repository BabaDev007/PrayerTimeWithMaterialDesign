import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazvaxti0521/Screens/MenuPages/AboutPrayerTimes/AboutPrayerTimes.dart';
import 'package:namazvaxti0521/Screens/MenuPages/GiveQuestion/GiveQuestion.dart';
import 'package:namazvaxti0521/Screens/MenuPages/Movies/MovieTile.dart';
import 'package:namazvaxti0521/Screens/MenuPages/UsefulLinks/UseFulLinks.dart';
import 'package:namazvaxti0521/Screens/MenuPages/ZikirMatik/ZikirMatik.dart';
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
        MenuListTile(icon: Icon(Icons.movie_creation_outlined, color: Colors.blue.shade300), title: "Dini Filmlər",widget: Movies(),),
        MenuListTile(icon: Icon(Icons.info_outline_rounded, color: Colors.blue.shade300), title: "Namaz Vaxtları",widget: AboutPrayerTimes(),),
        MenuListTile(icon: Icon(Icons.link, color: Colors.blue.shade300), title: "Faydalı Keçidlər",widget: UsefulLinks(),),
        UrlLauncherTile(icon: Icon(Icons.question_answer_outlined, color: Colors.blue.shade300), title: "Sual Göndər", path: 'https://form.jotform.com/203285791454461',),
        MenuListTile(icon: Icon(Icons.feedback_outlined, color: Colors.blue.shade300), title: "Əlaqə",widget: FeedbackPage(),),
        MenuListTileSHare(title: "Paylaş", icon: Icon(Icons.share_outlined, color: Colors.blue.shade300)),
        MenuListTile(icon: Icon(Icons.info_outline_rounded, color: Colors.blue.shade300), title: "İnfo",widget: QiblahCompass(),),
        MenuTile(title: "Version", icon: Icon(Icons.verified_outlined, color: Colors.blue.shade300), )






      ]

    );
  }
}








