import 'package:flutter/material.dart';
import '../../model/home_model.dart';

class AdBanner extends StatelessWidget {
  final IntegralMallPic advertessPicture;
  const AdBanner({Key key,this.advertessPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        child: Image.network(advertessPicture.pICTUREADDRESS),
      ),
    );
  }
}
