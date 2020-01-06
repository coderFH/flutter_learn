import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/detail_info_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//商品详情页的首屏区域，包括图片、商品名称，商品价格，商品编号的UI展示
class DetailsTopArea extends StatelessWidget {
  const DetailsTopArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<DetailsInfoProvide>(
        builder: (context,child,val) {
          var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsDetail.data.goodInfo;
          if (goodsInfo != null) {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.all(2.0),
              child: Column(
                children: <Widget>[
                  _goodsImage(goodsInfo.image1),
                  _goodsName(goodsInfo.goodsName),
                  _goodNumber(goodsInfo.goodsSerialNumber),
                  _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
                ],
              ),
            );
          } else {
            return Text('正在加载中......');
          }
        },
      ),
    );
  }

  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }
  
  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }

  Widget _goodNumber(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号:${num}',
        style: TextStyle(
          color: Colors.black26
        ),
      ),
    );
  }

  Widget _goodsPrice(presentPrice,oriPrice) {
    return Container(
      width: ScreenUtil().setWidth(730),
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: <Widget>[
          Text(
            '￥$presentPrice',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Text(
            '市场价:￥$oriPrice',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          )
        ],
      ),
    );
  }
}