import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/strings.dart';
import 'core/locale/locale_manager.dart';
import 'core/router/app_router.gr.dart';
import 'core/theme/theme_manager.dart';
import 'core/utility/observers/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: LocaleManager.instance.supportedLocales,
      path: LocaleManager.instance.path,
      fallbackLocale: LocaleManager.instance.en,
      child: ValorantUniverseRemastered(),
    ),
  );
}

class ValorantUniverseRemastered extends StatelessWidget {
  ValorantUniverseRemastered({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,

      // localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      //theme
      themeMode: ThemeMode.dark,
      darkTheme: ThemeManager.instance.darkTheme,

      // routing
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
