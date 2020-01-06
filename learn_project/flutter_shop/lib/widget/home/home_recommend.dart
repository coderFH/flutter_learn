import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';

class Recommend extends StatelessWidget {
  final List recommendList;
  const Recommend({Key key,this.recommendList}) : super(key: key);

  Widget _titleWidget() {
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.black12
            )
          )
        ),
        child: Text(
          '商品推荐',
          style: TextStyle(color: Colors.pink),
        ),
      );
  }
  
  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context,index) {
          return _item(context,index);
        },
      ),
    );
  }

  Widget _item(context,index) {
    return InkWell(
      onTap: (){
        Application.router
            .navigateTo(context, "/detail?id=${recommendList[index].goodsId}");
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              width: 0.5,
              color: Colors.black12
            )
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index].image),
            Text('￥${recommendList[index].mallPrice}'),
            Text('￥${recommendList[index].price}',
              style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }
}