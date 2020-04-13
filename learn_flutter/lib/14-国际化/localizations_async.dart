import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FHAsyncLocalizations {
  final Locale locale;

  FHAsyncLocalizations(this.locale);

  //正常情况下,外界使用时是 Localizations.of(context, HYLocalizations).title
  //我们可以封装一下这个方法,外界使用的时候可以直接 FHLocalizations.of(context).title
  //会更加方便点
  static FHAsyncLocalizations of(BuildContext context) {
    return Localizations.of(context, FHAsyncLocalizations);
  }

  static Map<String, Map<String,String>> _localizedValues = {};

  void loadJson() async {
    //1.加载json文件
    final jsonString = await rootBundle.loadString("assets/i18n.json");

    //2.对json进行解析
    final Map<String, dynamic> map = json.decode(jsonString);

    // 3.注意：这里是将Map<String, dynamic>转成Map<String, Map<String, String>>类型
    _localizedValues = map.map((key, value) {
        return MapEntry(key, value.cast<String, String>());
    });
  }

  String get title {
    return _localizedValues[locale.languageCode]["title"];
  }

  String get greet {
    return _localizedValues[locale.languageCode]["greet"];
  }

  String get pickTime {
    return _localizedValues[locale.languageCode]["picktime"];
  }

}