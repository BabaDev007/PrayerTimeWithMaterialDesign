import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namazvaxti0521/Constants.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Container(
      alignment: Alignment.center,
      child:  Lottie.asset(Constants().compassLottiePath, height: 50),
    );
  }
}