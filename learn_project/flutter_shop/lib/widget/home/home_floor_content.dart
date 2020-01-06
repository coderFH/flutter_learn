import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';
import '../../routers/application.dart';

class FloorContent extends StatelessWidget {
  final List<Floor> floorGoodsList;
  const FloorContent({Key key,this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _otherGoods(context)
        ],
      ),
    );
  }

  Widget _firstRow(BuildContext context) {
    return Row(
      children: <Widget>[
      _goodsItem(context,floorGoodsList[0]),
      Column(
        children: <Widget>[
          _goodsItem(context,floorGoodsList[1]),
          _goodsItem(context,floorGoodsList[2]),
        ],
      )
      ],
    );
  }

  Widget _otherGoods(BuildContext context) {
    return Row(
      children: <Widget>[
       _goodsItem(context,floorGoodsList[3]),
       _goodsItem(context,floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(BuildContext context, Floor goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: (){
          Application.router.navigateTo(context, "/detail?id=${goods.goodsId}");
        },
        child: Image.network(goods.image),
      ),
    );
  }
}

