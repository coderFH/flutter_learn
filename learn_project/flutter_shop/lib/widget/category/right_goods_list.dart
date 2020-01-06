import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category_list_model.dart';
import '../../provide/category_child_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/category_goods_list_Provide.dart';
import '../../service/service_method.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../routers/application.dart';

class RigthGoodsList extends StatefulWidget {
  RigthGoodsList({Key key}) : super(key: key);
  @override
  _RigthGoodsListState createState() => _RigthGoodsListState();
}


class _RigthGoodsListState extends State<RigthGoodsList> {
  var scrollController;
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() { 
    super.initState();
    scrollController = ScrollController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context,child,data){
        try {
          if (Provide.value<ChildCategoryPrivode>(context).page == 1){
            if(scrollController.hasClients && scrollController.offset > 100) {
              scrollController.jumpTo(0.0);
            }
          }
        } catch(e) {
          print('进入页面第一次初始化:${e}');
        }
        if (data.goodsList.length > 0) {
          return Expanded(
            child: EasyRefresh(
              controller: _controller,
              bottomBouncing: true,
              
              footer: ClassicalFooter(
                bgColor:Colors.white,
                textColor:Colors.pink,
                infoColor: Colors.pink,
                showInfo:false,
                noMoreText:Provide.value<ChildCategoryPrivode>(context).noMoreText,
                loadText:'加载中',
                loadReadyText:'上拉加载',
              ),
            
              onLoad: () async {
                _getMoreList();
              },
              
              child: ListView.builder(
                controller: scrollController,
                itemCount: data.goodsList.length,
                itemBuilder: (context,index){
                  return _ListWidget(index,data.goodsList);
                },
              ),
            ),
          );
        } else {
          return Text("暂时没有数据");
        }
      }
    );
  }

  Widget _ListWidget(int index,List<CategoryListData> list) {
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/detail?id=${list[index].goodsId}");
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0,color: Colors.black26)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(index,list),
            Column(
              children: <Widget>[
                _goodsName(index,list),
                _goodsPrice(index,list)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(index,List<CategoryListData> list) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  Widget _goodsName(index,List<CategoryListData> list) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(index,List<CategoryListData> list) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格:￥${list[index].presentPrice}',
            style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }

  void _getMoreList() async {
    Provide.value<ChildCategoryPrivode>(context).addPage();
    //构建入参
    var data = {
      'categoryId': Provide.value<ChildCategoryPrivode>(context).categoryId,
      'categorySubId': Provide.value<ChildCategoryPrivode>(context).subId,
      'page': Provide.value<ChildCategoryPrivode>(context).page
    };
    await request('getMallGoods',formData:data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Provide.value<ChildCategoryPrivode>(context).changeNoMore('没有更多了');
        _showToast('已经到底了');
      } else {
        Provide.value<CategoryGoodsListProvide>(context).addGoodsList(goodsList.data);
      }
    });
  }

  _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.pink,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}