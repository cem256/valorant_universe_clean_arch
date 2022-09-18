import 'package:flutter/material.dart';

import '../constants/assets.dart';

class LocaleManager {
  static LocaleManager? _instance;
  static LocaleManager get instance {
    _instance ??= LocaleManager._init();
    return _instance!;
  }

  LocaleManager._init();

  final en = const Locale("en", "US");

  final path = Assets.translationsPath;
  List<Locale> get supportedLocales => [en];
}
