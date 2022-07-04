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
import '../../StateManagement/StateManagement.dart';
import '../../ThemeService/ThemeDataService.dart';

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


    return BackdropScaffold(
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

    );


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


      firstChild: Container( child: Text("NamazVaxtı"), padding: PaddingManager().titlePadding,  decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.lightBlue.shade100,

      )),
      secondChild: Container( child: Text("Menu"), padding: PaddingManager().titlePadding,  decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.lightBlue.shade100,

      )),
    );
  }
}




