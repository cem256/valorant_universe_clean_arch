import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_universe_remastered/core/constants/strings.dart';
import 'package:valorant_universe_remastered/core/locale/locale_manager.dart';
import 'package:valorant_universe_remastered/core/router/app_router.dart';
import 'package:valorant_universe_remastered/core/theme/theme_manager.dart';
import 'package:valorant_universe_remastered/core/utility/observers/simple_bloc_observer.dart';
import 'package:valorant_universe_remastered/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initServices();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: getIt<LocaleManager>().supportedLocales,
      path: getIt<LocaleManager>().path,
      fallbackLocale: getIt<LocaleManager>().en,
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
      darkTheme: getIt<ThemeManager>().darkTheme,

      // routing
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
