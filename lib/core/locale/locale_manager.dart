import 'package:flutter/material.dart';

import '../constants/assets.dart';

class LocaleManager {
  final en = const Locale("en", "US");

  final path = Assets.translationsPath;
  List<Locale> get supportedLocales => [en];
}
