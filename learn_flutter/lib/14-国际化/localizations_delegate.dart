import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'localizations.dart';

class FHLocalizationsDelegate extends LocalizationsDelegate<FHLocalizations> {

  static FHLocalizationsDelegate delegate = FHLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<FHLocalizations> old) {
    return false;
  }

  @override
  Future<FHLocalizations> load(Locale locale) {
    //因为load方法返回的是Future对象,而我们加载数据是本地直接写死,涉及不到异步,所以使用SynchronousFuture包裹一下
    return SynchronousFuture(FHLocalizations(locale));
  }
}
