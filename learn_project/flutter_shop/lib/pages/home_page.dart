import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_shop/model/home_model.dart';

import '../service/service_method.dart';

import '../widget/home/home_swiper.dart'; //轮播图
import '../widget/home/home_category.dart'; //金刚位
import 'package:flutter_shop/widget/home/home_adbanner.dart'; //广告位
import 'package:flutter_shop/widget/home/home_leaderinfo.dart'; //领导信息
import '../widget/home/home_recommend.dart' as HomeRecommend; //商品推荐
import '../widget/home/home_floor_title.dart'; //楼层标题
import '../widget/home/home_floor_content.dart'; //楼层内容
import 'package:flutter_shop/widget/home/home_hotgoods.dart'; //火爆专区

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  String homePageContent = '正在获取数据';
  int page = 1;
  List<Map> hotGoodsList = [];
  EasyRefreshController _controller = EasyRefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("百姓生活+"),
      ),
      body: FutureBuilder(
        future: request(
          'homePageContent',
           formData: {'lon': '115.02932', 'lat': '35.76189'},
        ),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            HomeModel homeModel = HomeModel.fromJson(
              json.decode(snapshot.data),
            );
            HomeModelData homeModelData = homeModel.data;
            return EasyRefresh(
              footer: MaterialFooter(
                backgroundColor: Colors.pink,
              ),
              onLoad: () async {
                _getHotGoods();
              },
              controller: _controller,
              child: ListView(
                children: <Widget>[
                  SwiperDiy(swiperDataList: homeModelData.slides,), //轮播图
                  TopNavigator(navigatorList: homeModelData.category,), //类别
                  AdBanner(advertessPicture: homeModelData.advertesPicture,), //广告,
                  LeaderPhone(shopInfo: homeModelData.shopInfo,), //leader信息
                  HomeRecommend.Recommend(recommendList: homeModelData.recommend,), //推荐商品
                  FloorTitle(floorPic:homeModelData.floor1Pic),
                  FloorContent(floorGoodsList:homeModelData.floor1),
                  FloorTitle(floorPic:homeModelData.floor2Pic),
                  FloorContent(floorGoodsList:homeModelData.floor2),
                  FloorTitle(floorPic:homeModelData.floor2Pic),
                  FloorContent(floorGoodsList:homeModelData.floor3),
                  HotGoods(hotGoods: hotGoodsList,),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("加载中"),
            );
          }
        },
      ),
    );
  }
    
  //获取火爆专区数据
  void _getHotGoods() {
    var formPage = {'page': page};
    request('homePageBelowConten',formData:formPage).then((val){
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List ).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++; 
      });
    });
  }
}

