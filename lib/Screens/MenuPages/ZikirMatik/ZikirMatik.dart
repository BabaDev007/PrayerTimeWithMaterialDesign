import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/services.dart'; // we need this for the vibrations
import 'dart:io'; // we need this for the sleep method


class ZikrPage extends StatefulWidget {


  @override
  State<ZikrPage> createState() => _ZikrPageState();
}

class _ZikrPageState extends State<ZikrPage> {
  _PatternVibrate() {
    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );
    HapticFeedback.mediumImpact();
  }



  int _counter = 0;

  void _incrementCounter() {
    HapticFeedback.vibrate();
    setState(() {
      if(_counter >= 0 && _counter <100)

      _counter++;
      if(_counter >= 0 && _counter <= 33 ){
        _zikr = "SübhanAllah";

      }else if(_counter >= 33 && _counter < 66){
        _zikr = "Əlhəmdulillah";
      }else if(_counter >= 66 && _counter <= 99){
        _zikr = "Allahu Əkbər";
      }else if(_counter == 100){
        _zikr = "Lə İləhə illəlahü vəhdəhü lə şərikə ləh ləhül mülkü və ləhül həmdu və hüvə alə kulli şey'in qadir";
      }
    });
  }

  void _decrementCounter() {
    HapticFeedback.vibrate();
    setState(() {
      if(_counter > 0 && _counter <=100)

      _counter--;
      if(_counter >= 0 && _counter <= 33 ){
        _zikr = "SübhanAllah";

      }else if(_counter >= 33 && _counter <= 66){
        _zikr = "Əlhəmdulillah";
      }else if(_counter >= 66 && _counter <= 99){
        _zikr = "Allahu Əkbər";
      }
    });
  }

  void _restart() {
    HapticFeedback.vibrate();
    setState(() {
      _counter = 0;
    });
  }
 String _zikr = "SübhanAllah";





    @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        centerTitle: true,
        title: Text("Zikrmat", textAlign: TextAlign.center ,style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SleekCircularSlider(

                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      trackColor: Colors.white,
                      progressBarColor: Colors.lightBlue


                    ),
                    customWidths: CustomSliderWidths(trackWidth: 10),
                    size: w/1.2
                  ),
                  min: 0,
                  max: 100,
            initialValue: _counter.toDouble(),

            onChange: (double value) {
                    setState((){
                      _counter = value.toInt();
                    });

            }),
              ),
               Align(
                 alignment: Alignment.center,
                 child: GestureDetector(
                   onTap: _incrementCounter,
                   child: Container(
                   width: w/2,
              height: w/2,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.lightBlueAccent),
                     child: Center(
                         child: FittedBox(
                           child: Padding(
                             padding: const EdgeInsets.all(20.0),
                             child: AnimatedFlipCounter(
                               textStyle: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),
                               duration: Duration(milliseconds: 300),
                               curve: Curves.decelerate,
                               value: _counter, /* pass in a number like 2014 */
                             ),
                           ),
                         )
                     ) ,

                   ),
                 ),
               ),

               Padding(
                padding: EdgeInsets.all(w/7),
                child: Align(
                  alignment: Alignment.topCenter,
                  child:
                  AutoSizeText(
                    '$_zikr', maxFontSize: 25, maxLines: 3 , textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                        FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          onPressed: _decrementCounter,
                          child:  Icon(
                            Icons.remove,
                            size: w/6,
                          ),
                        ),



                      FloatingActionButton(
                          mini: true,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          onPressed: _restart,
                          child:  Icon(
                            Icons.restart_alt,
                            size: w/10,
                          ),
                        ),


                      FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          onPressed: _incrementCounter,
                          child:  Icon(
                            Icons.add,
                            size: w/6,
                          ),
                        ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
