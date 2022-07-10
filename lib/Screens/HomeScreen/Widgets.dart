import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PrayerTimeWidget extends StatefulWidget {
  final String name;
  final String time;

  PrayerTimeWidget(this.name, this.time);

  @override
  State<PrayerTimeWidget> createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText("${widget.name}", minFontSize: 14  , maxFontSize:18 ,style: Theme.of(context).textTheme.displaySmall?.copyWith(fontFamily: "Oswald", ),),
          AutoSizeText("${widget.time}", minFontSize: 14 ,maxFontSize: 20 , style: Theme.of(context).textTheme.displaySmall?.copyWith(fontFamily: "Oswald", ),)

        ],
      ),
    ) ;
  }
}
class Zor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.tealAccent.shade400.withOpacity(.9), Colors.lightBlueAccent.shade700.withOpacity(.9)]

          )
      ),
    );
  }
}
class Zorro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset("assets/mosque.png", fit: BoxFit.cover, ));
  }
}