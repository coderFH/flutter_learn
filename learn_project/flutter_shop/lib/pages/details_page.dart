import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/detail_info_provide.dart';
import '../widget/detail/details_top_area.dart';
import '../widget/detail/details_explain.dart';
import '../widget/detail/details_tabbar.dart';
import '../widget/detail/details_web.dart';
import '../widget/detail/details_bottom.dart';

class DetailsPage extends StatelessWidget {

  final String goodsId;
  const DetailsPage({Key key,this.goodsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("商品详情页"),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    DetailsTopArea(),
                    DetailsExplain(),
                    DetailsTabBar(),
                    DetailsWeb(),
                  ],
                ),
                Positioned(
                  child: DetailsBottom(),
                  bottom: 0,
                  left: 0,
                ),
              ],
            );
          } else {
            return Text("加载中");
          }
        },
      ),
    );
  }

  Future _getBackInfo(BuildContext context )async{
      await  Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
      return '完成加载';
  }
}