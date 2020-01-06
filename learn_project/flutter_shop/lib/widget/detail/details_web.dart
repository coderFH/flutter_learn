import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/detail_info_provide.dart';
import 'package:flutter_html/flutter_html.dart';


class DetailsWeb extends StatelessWidget {
  const DetailsWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provide.value<DetailsInfoProvide>(context).goodsDetail.data.goodInfo.goodsDetail;
    return Provide<DetailsInfoProvide>(
      builder: (context,child,val) {
        var isLeft = Provide.value<DetailsInfoProvide>(context).isLeft;
        if (isLeft) {
          return Container(
            child: Html(
              data: goodsDetail,
            ),
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text("暂时没有数据"),
          );
        }
      },
    );
  }
}