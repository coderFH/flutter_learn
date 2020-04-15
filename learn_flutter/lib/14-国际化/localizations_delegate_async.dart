import 'package:flutter/cupertino.dart';
import 'localizations_async.dart';

class FHAsyncLocalizationsDelegate extends LocalizationsDelegate<FHAsyncLocalizations> {

  static FHAsyncLocalizationsDelegate delegate = FHAsyncLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<FHAsyncLocalizations> old) {
    return false;
  }

  @override
  Future<FHAsyncLocalizations> load(Locale locale) async {
    final localizations = FHAsyncLocalizations(locale);
    await localizations.loadJson();
    return localizations;
  }
}
