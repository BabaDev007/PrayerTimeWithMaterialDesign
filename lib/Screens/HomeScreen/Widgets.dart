import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:namazvaxti0521/Screens/MenuPages/Books/BookList.dart';
import 'package:namazvaxti0521/Screens/MenuPages/KompassScreen/qiblah_compass.dart';
import 'package:namazvaxti0521/Screens/MenuPages/Movies/MovieTile.dart';
import 'package:namazvaxti0521/Screens/MenuPages/ZikirMatik/ZikirMatik.dart';
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
          AutoSizeText("${widget.name}", minFontSize: 14  , maxFontSize:18 ,style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontFamily: "Oswald",)),
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

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Tooltip(
                          message: "Dini Kitablar",
                          child: InkResponse(onTap: (){Get.to(BookList()); },
                            child: Container(
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/kitablar.png', ),
                              ),
                              height: 70,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(20))

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Tooltip(
                          message: "Dijital Təsbih",
                          child: InkResponse(onTap: (){Get.to(ZikrPage()); },
                            child: Container(
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/tasbeh.png', ),
                              ),
                              height: 70,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(20))

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Tooltip(
                          message: "Dini Filmlər",
                          child: InkResponse(onTap: (){Get.to(Movies()); },
                            child: Container(
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/movie.png', ),
                              ),
                              height: 70,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(20))

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Tooltip(
                          message: "Dini Filmlər",
                          child: InkResponse(onTap: (){Get.to(Movies()); },
                            child: Container(
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/movie.png', ),
                              ),
                              height: 70,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(20))

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Tooltip(
                          message: "Dini Filmlər",
                          child: InkResponse(onTap: (){Get.to(Movies()); },
                            child: Container(
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/movie.png', ),
                              ),
                              height: 70,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(20))

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Tooltip(
                          message: "Qiblə",
                          child: InkResponse(onTap: (){Get.to(QiblahCompass()); },
                            child: Container(
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/kompasss.png', ),
                              ),
                              height: 70,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(20))

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
