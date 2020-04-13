import 'package:flutter/cupertino.dart';

class FHLocalizations {
  final Locale locale;

  FHLocalizations(this.locale);

  //正常情况下,外界使用时是 Localizations.of(context, HYLocalizations).title
  //我们可以封装一下这个方法,外界使用的时候可以直接 FHLocalizations.of(context).title
  //会更加方便点
  static FHLocalizations of(BuildContext context) {
    return Localizations.of(context, FHLocalizations);
  }

  static Map<String, Map<String,String>> _localizedValues = {
    "en": {
      "title": "home",
      "greet": "hello~",
      "picktime": "Pick a Time"
    },
    "zh": {
      "title": "首页",
      "greet": "你好~",
      "picktime": "选择一个时间"
    }
  };

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