import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazvaxti0521/Constants.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:namazvaxti0521/Screens/MenuPages/Esmail_Husna/EsmaScreen.dart';
import '../../StateManagement/StateManagement.dart';
import '../../ThemeService/ThemeDataService.dart';
import '../MenuPages/ZikirMatik/ZikirMatik.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Widgets.dart';

class HomeScreen extends StatefulWidget  {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  late final   controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
  HomePageController Scontroller = Get.put(HomePageController());

  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(

        title: Center(child: Text('Çıxış')),
        content: Text('Tətbiqdən çıxış etmək istəyirsiniz ?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('Xeyr'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:Text('Bəli'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }


  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    var _h = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: showExitPopup,
    child:  Scaffold(

      backgroundColor: Colors.greenAccent.shade100,
      extendBodyBehindAppBar: true,
      appBar: AppBar(

          centerTitle: true,
          title: Text("Namaz Pro", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
          leading: Icon(Icons.menu_outlined, color: Colors.white, ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,


        actions: [
          GestureDetector(
              onTap: (){


                Get.isDarkMode ?   controller.animateTo(0) :  controller.animateTo(0.5);
                ThemeService().changeThemeMode();
              },
              child: Lottie.asset(
                  Constants().lottieasset, controller: controller,
                  fit: BoxFit.fill


              )),

        ]
      ),
     body:Stack(
       alignment: Alignment.center,
       children: [
         Zorro(),
         Zor(),

         Align(
           alignment: Alignment.bottomCenter,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Expanded(
                   flex: 2,
                   child: Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: SizedBox()
                   ),
                 ),
                 Expanded(
                   flex: 1,
                  child:
                  ButtonWidgets()
                 ),
                 Expanded(
                   flex: 2 ,
                   child: Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: Container(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                         child: SingleChildScrollView(
                           physics: BouncingScrollPhysics(),
                           child: Column(
                             mainAxisSize: MainAxisSize.min,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               PrayerTimeWidget("Sübh", "05:05"),
                               Padding(
                                 padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Divider(color: Colors.black12, thickness: 0.8,),
                               ),
                               PrayerTimeWidget("Günəş", "05:05"),


                               Padding(
                                 padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Divider(color: Colors.black12, thickness: 0.8,),
                               ),
                               PrayerTimeWidget("Zöhr", "05:05"),


                               Padding(
                                 padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Divider(color: Colors.black12, thickness: 0.8,),
                               ),
                               PrayerTimeWidget("Əsr", "05:05"),

                               Padding(
                                 padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Divider(color: Colors.black12, thickness: 0.8,),
                               ),
                               PrayerTimeWidget("Axşam(İftar)", "05:05"),

                               Padding(
                                 padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Divider(color: Colors.black12, thickness: 0.8,),
                               ),
                               PrayerTimeWidget("İşa", "05:05"),


                               Padding(
                                 padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Divider(color: Colors.black12, thickness: 0.8,),
                               ),
                               PrayerTimeWidget("Gecə Yarısı", "05:05"),





                             ],
                           ),
                         ),
                       ),

                       width: _w,

                       decoration: BoxDecoration(
                           color: Colors.white.withOpacity(0.5),
                           borderRadius: BorderRadius.all(Radius.circular(20))

                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),

       ],
     ),
     )





    );


  }
}
