import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:lottie/lottie.dart';
import '../../../Constants.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ReligionThemes extends StatefulWidget {

  final String path;
  final String AppBarPath;


  const ReligionThemes(this.path, this.AppBarPath, {Key? key}) : super(key: key);

  @override
  State<ReligionThemes> createState() => _ReligionThemesState();
}

class _ReligionThemesState extends State<ReligionThemes> {

  bool isOpened = true;
  bool ActiveConnection = false;
  String T = "";
  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          ActiveConnection = true;
          T = "Turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        ActiveConnection = false;
        T = "Turn On the data and repress again";
      });
    }
  }

  /////////////////////////////////////////////////////////////////////
  @override
  initState(){
    CheckUserConnection();
    super.initState();
  }
  @override
  dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Constants().scaffolColor,

          body:


          Stack(
             children: [

               WebViewPlus(
                 backgroundColor: Constants().scaffolColor ,

                onPageFinished: (value){
                  setState((){
              isOpened = false;
                  });
                },

                initialUrl: widget.path,
                javascriptMode: JavascriptMode.unrestricted,
          ) ,
               isOpened ? Container(
                   alignment: Alignment.center,
                   child:  Lottie.asset(Constants().compassLottiePath, height: 50)) : Stack(),

               ActiveConnection ? Stack() : Container(
                 height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width,
                 color: Constants().scaffolColor,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Icon(Icons.wifi_off, size: 50,),
                     Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: AutoSizeText("İnternet bağlantınız mövcud deyil", style: Theme.of(context).textTheme.headline5, maxLines: 1,),
                     )
                   ],
                 ),
               )

             ],
           )
      ),
    );

  }
}
