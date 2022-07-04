import 'package:flutter/material.dart';
import 'package:namazvaxti0521/Screens/MenuPages/Books/BookTile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../Constants.dart';
import 'BookNameClass.dart';


class BookList extends StatefulWidget {
   BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Constants().scaffolColor,

      body: AnimationLimiter(
        child:  ListView.builder(
            padding: EdgeInsets.all(_w / 30),
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: BookListDart.BookListView.length,
            itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                delay: Duration(milliseconds: 80),
              child: SlideAnimation(
              duration: Duration(milliseconds: 1800),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: 30,
              verticalOffset: 300.0,
              child: FlipAnimation(
              duration: Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
              flipAxis: FlipAxis.y,
              child: BookTile(
              BookListDart.BookListView[index].bookPngPath,
              BookListDart.BookListView[index].bookTitle,
              BookListDart.BookListView[index].subtitle,
              BookListDart.BookListView[index].bookLink
              ),
              ),
              ),
            );
          },

          ),
        ),
    );
  }
}



