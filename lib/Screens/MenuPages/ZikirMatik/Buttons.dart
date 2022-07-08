import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZikrButton extends StatefulWidget {
  final Function() metod;
  final String buttonName;

  const ZikrButton({super.key, required this.metod, required this.buttonName});
  @override
  _ZikrButtonState createState() => _ZikrButtonState();
}

class _ZikrButtonState extends State<ZikrButton>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: widget.metod,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 55 : 60,
        width: isTapped ? 150 : 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: Offset(3, 7),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '${widget.buttonName}',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}