import 'package:flutter/material.dart';
import '../../model/home_model.dart';
import 'home_movie_item.dart';
import '../../service/home_request.dart';

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