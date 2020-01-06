import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/home_model.dart';

class LeaderPhone extends StatelessWidget {
  final ShopInfo shopInfo;

  const LeaderPhone({Key key,this.shopInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: InkWell(
          onTap: _launchURL,
          child: Image.network(shopInfo.leaderImage),
        ),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + shopInfo.leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch $url";
    }
  }
}