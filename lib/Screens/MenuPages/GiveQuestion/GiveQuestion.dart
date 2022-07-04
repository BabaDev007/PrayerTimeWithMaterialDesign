import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../PaddingManager.dart';
import '../../../PageTransition/PageTransition.dart';

class UrlLauncherTile extends StatelessWidget {

  final String title;
  final Icon icon;
  final String path;


  UrlLauncherTile({required this.title,  this.icon = const Icon(Icons.web_outlined),  this.path = "", Key? key}) : super(key: key);
  void _launchUrl() async {
    if (!await launch(Uri.parse(path).toString(), forceSafariVC: true, forceWebView: false)) throw 'Could not launch $path';
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: () {
                  _launchUrl();
          },
          child: Container(
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .errorColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.2),
                    blurRadius: 30,
                    offset: Offset(20, 30),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),


              child: ListTile(
                leading: icon,
                title: Text(title),
                trailing: Icon(Icons.chevron_right),

              )),
        ));
  }}