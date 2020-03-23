import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/05-douban/utils/log.dart';
import '../../model/home_model.dart';
import '../../widgets/dashed_line.dart';
import '../../widgets/star_rating.dart';

class FHHomeMoviewItem extends StatelessWidget {
  final MovieItem movie;

  FHHomeMoviewItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 8,
            color: Color(0xffcccccc)
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(height: 8,),
          buildContent(),
          SizedBox(height: 8,),
          buildFooter()
        ],

      ),
    );
  }

  // 1.头部的布局
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "NO.${movie.rank}",
        style: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 131, 95, 36)
        ),
      ),
    );
  }

  // 2.内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(width: 8,),
        buildContentInfo(),
        SizedBox(width: 8,),
        buildContentLine(),
        SizedBox(width: 8,),
        buildContentWish(),
      ],
    );
  }


  // 2.1.内容的图片
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        movie.imageURL,height: 150,
      ),
    );
  }

  // 2.2.内容的信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(height: 8,),
          buildContentInfoRate(),
          SizedBox(height: 8,),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  //2.2.1
  Widget buildContentInfoTitle() {
    FHLog("aaaaaa", StackTrace.current);
    return Row(
      children: <Widget>[
        Icon(
          Icons.play_circle_outline,
          color: Colors.pink,
          size: 20,
        ),
        Expanded(
          child: Text(
            "12222222222222222222222pppppppppppp22222222",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
        )),
        Expanded(child: Text("1233231231231231312313123123"))
      ],
    );

//    return Text.rich(
//      TextSpan(
//        children: [
//          WidgetSpan(
//            child: Icon(
//              Icons.play_circle_outline,
//              color: Colors.pink,
//              size: 40,
//            ),
//            baseline: TextBaseline.ideographic,
//            alignment: PlaceholderAlignment.middle
//          ),
//          WidgetSpan(child: Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: PlaceholderAlignment.middle),
//          WidgetSpan(child: Text("(${movie.playDate})"), style: TextStyle(fontSize: 18, color: Colors.grey))
//        ]
//      )
//    );
  }

  //2.2.2
  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        FHStarRating(
          rating: movie.rating,
          size: 20,
        ),
        SizedBox(width: 6,),
        Text(
          "${movie.rating}",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  //2.2.3
  Widget buildContentInfoDesc() {
    // 1.字符串拼接
    final genresString = movie.genres.join(" ");
    final directorString = movie.director.name;
    List<Actor> casts = movie.casts;
    final actorString = movie.casts.map((item) => item.name).join(" ");

    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  // 2.3.内容的虚线
  Widget buildContentLine() {
    return Container(
      height: 100,
      child: FHDashedLine(
        axis: Axis.vertical,
        dashedWidth: 2,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  // 2.4.内容的想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home/wish.png"),
          Text(
            "想看",
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 235, 170, 60)
            ),
          )
        ],
      ),
    );
  }

  // 3.尾部的布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius : BorderRadius.circular(6)
      ),
      child: Text(
        movie.originalTitle,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff666666),
        ),
      ),
    );
  }
}
