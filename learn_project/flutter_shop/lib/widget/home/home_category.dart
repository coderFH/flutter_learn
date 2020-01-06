import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';

class TopNavigator extends StatelessWidget {
  final List<Category> navigatorList;
  TopNavigator({Key key,this.navigatorList}) : super(key:key);

  Widget _gridViewItemUI(BuildContext context,item) {
    return InkWell(
      onTap: (){},//Application.router.navigateTo(context, '/detail?id=${item.mallCategoryId}');
      child: Column(
        children: <Widget>[
          Image.network(item.image,width: ScreenUtil().setWidth(95),),
          Text(item.mallCategoryName)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 5) {
      navigatorList.removeRange(5, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.all(3.0),
      color: Colors.white70,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),//解决GridView 和listview 冲突
        crossAxisCount: 4,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}