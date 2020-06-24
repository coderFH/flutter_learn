import 'package:catefavor/ui/pages/home/home_category_item.dart';
import 'package:flutter/material.dart';

import 'package:catefavor/core/model/category_model.dart';
import 'package:catefavor/core/services/json_parse.dart';
import 'package:catefavor/core/extension/int_extension.dart';

class FHHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FHCategoryModel>>(
      future: FHJsonParse.getCategoryData(),
      builder: (ctx,snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);
        if (snapshot.error != null) return Center(child: Text("请求失败"),);

        final categories = snapshot.data;

        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.px,
              mainAxisSpacing: 20.px,
              childAspectRatio: 1.5
            ),
            itemCount: categories.length,
            itemBuilder: (ctx,index){
              return FHHomeCategoryItem(categories[index]);
            }
        );
      }
    );
  }
}


//class FHHomeContent extends StatefulWidget {
//  @override
//  _FHHomeContentState createState() => _FHHomeContentState();
//}
//
//class _FHHomeContentState extends State<FHHomeContent> {
//
//  List<FHCategoryModel> _categories = [];
//
//  @override
//  void initState() {
//    super.initState();
//
//    // 加载数据
//    FHJsonParse.getCategoryData().then((res) {
//      setState(() {
//        _categories = res;
//        print(res);
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Text("111111");
//  }
//}
