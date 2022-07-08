import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazvaxti0521/Constants.dart';
import 'package:namazvaxti0521/PaddingManager.dart';
import 'package:namazvaxti0521/Screens/HomeScreen/BackDropLayer/BockdropBackLayer.dart';
import 'package:namazvaxti0521/Screens/HomeScreen/HomeScreenBody.dart';
import 'package:backdrop/backdrop.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:namazvaxti0521/Screens/MenuPages/Books/BookList.dart';
import 'package:namazvaxti0521/Screens/MenuPages/KompassScreen/qiblah_compass.dart';
import 'package:namazvaxti0521/Screens/MenuPages/ReligionThemes/ReligionThemes.dart';
import '../../PageTransition/PageTransition.dart';
import '../../StateManagement/StateManagement.dart';
import '../../ThemeService/ThemeDataService.dart';
import '../MenuPages/ZikirMatik/ZikirMatik.dart';

class HomeScreen extends StatefulWidget  {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {

  var PWcontroller;
  late final   controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
  late int _currentIndex = 0;
  bool name  = true;
  bool isScroll = false;
  void _setState(){
    PWcontroller  = PageController();
    setState((){

    });
  }
  HomePageController Scontroller = Get.put(HomePageController());

  @override
    initState(){
    _setState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

    return WillPopScope(
        onWillPop: showExitPopup,
    child:  BackdropScaffold(


      frontLayerScrim: Colors.blue,

      onBackLayerRevealed: (){
        setState((){
          name = false;
        });
      },
      onBackLayerConcealed: (){
        setState((){
          name =true;
        });
      },
      frontLayerBackgroundColor:Constants().scaffolColor,
      backgroundColor: Colors.blue.shade300,
      animationCurve: Curves.easeOutCubic,
      backLayerBackgroundColor: Theme.of(context).hintColor,

      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling ,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,


      appBar: BackdropAppBar(
         backgroundColor: Colors.blue.shade300,

        centerTitle: true,
        title: Title(name: name,),
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(SizeTransition3(ZikrPage()));

            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              maxRadius: 15,

              child:
              Image.asset('assets/bookPng/tesbih.png'),
            ),
          ),

          GestureDetector(
              onTap: (){

                Get.isDarkMode ?  controller.animateTo(0) :  controller.animateTo(0.5);
                ThemeService().changeThemeMode();
              },
              child: Lottie.asset(
                  Constants().lottieasset, controller: controller,
                fit: BoxFit.fill


              )),
        ]
      ),
      backLayer: BackDropLayerContent(),
      frontLayer: PageView(physics: isScroll ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),

        onPageChanged: (value){
          setState((){
            _currentIndex = value;

          });

        },
        controller: PWcontroller ,
        children: [
          HomeScreenBody(),
          BookList(),
          ReligionThemes("https://www.gozelislam.com", ""),
          QiblahCompass()


        ],
      ),



      bottomNavigationBar: Visibility(
        visible: name,

          child:  BottomNavyBar(
              selectedIndex: _currentIndex,
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.linear,
              onItemSelected: (index) => setState(() {
                _currentIndex = index;
                switch(_currentIndex ){
                  case 0: PWcontroller.animateToPage(_currentIndex, curve: Curves.decelerate, duration: Duration(microseconds: 2000));
                  setState((){
                    isScroll = false;
                  });
                  break;
                  case 1: PWcontroller.animateToPage(_currentIndex, curve: Curves.decelerate, duration: Duration(microseconds: 2000));
                  setState((){
                    isScroll = false;
                  });
                  break;
                  case 2: PWcontroller.animateToPage(_currentIndex, curve: Curves.decelerate, duration: Duration(microseconds: 2000));
                  setState((){
                    isScroll = true;
                  });
                  break;
                  case 3: PWcontroller.animateToPage(_currentIndex, curve: Curves.decelerate, duration: Duration(microseconds: 2000));
                  setState((){
                    isScroll = false;
                  });
                  break;
                  default : PWcontroller.animateToPage(_currentIndex, curve: Curves.decelerate, duration: Duration(microseconds: 2000));
                }
              }),
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.apps),
                  title: Text('Əsas'),
                  activeColor: Colors.blue,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.book_outlined),
                  title: Text('Kitabxana '),
                  activeColor: Colors.blue,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon:Icon(Icons.newspaper_outlined) ,
                  title: Text(
                    'Mövzular',
                  ),
                  activeColor: Colors.blue,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.compass_calibration_outlined),
                  title: Text('Kompas'),
                  activeColor: Colors.blue,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

    ));


  }
}













class Title extends StatefulWidget {
  const Title({Key? key, required this.name}) : super(key: key);
  final bool name;



  @override
  State<Title> createState() => _TitleState();
}

class _TitleState extends State<Title> {

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(

      duration: Duration(milliseconds:600 ),

      crossFadeState:  widget.name  ? CrossFadeState.showFirst : CrossFadeState.showSecond ,


      firstChild: Card(
        color: Colors.lightBlueAccent,
        shape: StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Gözel İslam", style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),),
          ), ),
      secondChild: Card(
        shape: StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Menu", style: Theme.of(context).textTheme.headline5,),
        ), ),
    );
  }
}




