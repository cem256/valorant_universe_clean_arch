import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_universe_remastered/app/constants/string_constants.dart';
import 'package:valorant_universe_remastered/app/l10n/app_l10n.dart';
import 'package:valorant_universe_remastered/app/router/app_router.dart';
import 'package:valorant_universe_remastered/app/router/custom_route_observer.dart';
import 'package:valorant_universe_remastered/app/theme/app_theme.dart';
import 'package:valorant_universe_remastered/core/utility/observers/custom_bloc_observer.dart';
import 'package:valorant_universe_remastered/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Locator.locateServices(baseUrl: StringContants.baseUrl);
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = CustomBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: AppL10n.supportedLocales,
      path: AppL10n.path,
      fallbackLocale: AppL10n.en,
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
      title: StringContants.appName,
      debugShowCheckedModeBanner: false,

      // localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      //theme
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme().theme,

      //routing
      routerConfig: _appRouter.config(
        navigatorObservers: () => [CustomRouteObserver()],
      ),
    );
  }
}
