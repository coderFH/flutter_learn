import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("会员中心"),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              _topHeader(),
              _orderTitle(),
              _orderType(),
              _actionList(),
            ],
          )
        ),
      ),
    );
  }

  Widget _topHeader(){
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(400),
      padding: EdgeInsets.all(20),
      color: Colors.pink,
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(200),
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557916647960&di=91dc3d144638df9dde121bf507cf5521&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201510%2F23%2F20151023172235_di24S.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              '方世玉',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text("我的订单"),
        trailing: Icon(Icons.arrow_right)
      ),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1,color: Colors.black12)),
      ),
    );
  }

  Widget _orderType() {
    return Container( 
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(Icons.party_mode,size: 30,),
                Text("待付款")
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(Icons.query_builder,size: 30,),
                Text("待发货")
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(Icons.directions_car,size: 30,),
                Text("待收货")
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(Icons.content_paste,size: 30,),
                Text("待评价")
              ],
            ),
          )
        ],
      )
    );
  }
  
  Widget _actionList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTitle('领取优惠券'),
          _myListTitle('已领取优惠券'),
          _myListTitle('地址管理'),
          _myListTitle('客服电话'),
          _myListTitle('关于我们'),
        ],
      ),
    );
  }

  Widget _myListTitle(String title) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
      // margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1,color: Colors.black12)),
      ),
    );
  }
}