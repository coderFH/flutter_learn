import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/pages/home/home_movie_item.dart';
import 'package:learn_flutter/douban/service/home_request.dart';
import 'package:learn_flutter/douban/widgets/dashed_line.dart';

class FHHomeContent extends StatefulWidget {
  @override
  _FHHomeContentState createState() => _FHHomeContentState();
}

class _FHHomeContentState extends State<FHHomeContent> {
  final List<MovieItem> moives = [];

  @override
  void initState() {
    HomeRequest.requestMovieList(0).then((res){
      setState(() {
        moives.addAll(res);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: moives.length,
        itemBuilder: (context,index) {
          return FHHomeMoviewItem(moives[index]);
        }
    );
  }
}