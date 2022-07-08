import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namazvaxti0521/Screens/HomeScreen/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ThemeService/ThemeDataService.dart';



void main() async{
  await GetStorage.init();

        SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,

       ));

  runApp(const PrayerTimeApp());
}

class PrayerTimeApp extends StatelessWidget {
  const PrayerTimeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home: HomeScreen(),
    );
  }
}

