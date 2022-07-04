import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazvaxti0521/PaddingManager.dart';
import 'package:namazvaxti0521/Screens/HomeScreen/PrayerTimeWidget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';

import '../../StateManagement/StateManagement.dart';



class BelowWidget extends StatefulWidget {


  @override
  State<BelowWidget> createState() => _BelowWidgetState();


}

class _BelowWidgetState extends State<BelowWidget> {
bool _zor = false;
  @override
  Widget build(BuildContext context) {
    return
        FlipCard(
          fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL, // default
          front: On(),

          back: Under()


    );



  }


  
}

class On extends StatefulWidget {
  const On({Key? key}) : super(key: key);

  @override
  State<On> createState() => _OnState();
}

class _OnState extends State<On> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Under extends StatefulWidget {
  const Under({Key? key}) : super(key: key);

  @override
  State<Under> createState() => _UnderState();
}

class _UnderState extends State<Under> {

  HomePageController Scontroller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return  Container(
    );
  }
}























