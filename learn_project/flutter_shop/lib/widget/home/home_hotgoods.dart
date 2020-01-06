import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';

class HotGoods extends StatelessWidget {
  final List hotGoods;
  const HotGoods({Key key,this.hotGoods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle(),
          _warpList(context),
        ],
      ),
    );
  }

  Widget _hotTitle() { 
    return Container (
      margin: EdgeInsets.only(top: 10.0) ,
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      child: Text("火爆专区"),
    );
  }

  Widget _warpList(context) {
    if (hotGoods.length != 0) {
      List<Widget> listWidget = hotGoods.map((val){
        return InkWell(
          onTap: (){
            Application.router.navigateTo(context, "/detail?id=${val['goodsId']}");
          },
          child: Container(
            width: ScreenUtil().setWidth(370),
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
            child: Column(
              children: <Widget>[
                Image.network(val['image'],width: ScreenUtil().setWidth(370),),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: ScreenUtil().setSp(26),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['mallPrice']}',textAlign: TextAlign.center,),
                    Text('￥${val['price']}',style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),)
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }
}