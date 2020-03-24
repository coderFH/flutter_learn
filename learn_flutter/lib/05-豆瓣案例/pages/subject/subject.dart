import 'package:flutter/material.dart';
import '../../widgets/star_rating.dart';

class FHSubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书影音"),
      ),
      body: Center(
        child: FHStarRating(rating: 7,),
      )
    );
  }
}
