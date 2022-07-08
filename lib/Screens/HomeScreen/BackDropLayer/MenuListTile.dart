import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../PaddingManager.dart';
import '../../../PageTransition/PageTransition.dart';

class MenuListTile extends StatelessWidget {

  final String title;
  final Icon icon;
  final String path;
  final Widget widget;

  MenuListTile({required this.title, required this.icon,  this.path = "",   required this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(SizeTransition3(widget));
          },
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).errorColor,
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
  }
}

class MenuTile extends StatelessWidget {

  final String title;
  final Icon icon;


  MenuTile({required this.title, required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: PaddingManager().prayerTimeWidgetPadding,
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).errorColor,
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
              trailing: Text("1.0.0", style: TextStyle(color: Colors.black54),),

            )));
  }

}

