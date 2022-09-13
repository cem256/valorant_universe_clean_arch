import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/strings.dart';
import 'core/router/app_router.gr.dart';
import 'core/theme/theme_manager.dart';
import 'core/utility/observers/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(ValorantUniverseRemastered());
}

class ValorantUniverseRemastered extends StatelessWidget {
  ValorantUniverseRemastered({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Strings.appName,

      debugShowCheckedModeBanner: false,

      //theme
      themeMode: ThemeMode.dark,
      darkTheme: ThemeManager.instance.darkTheme,

      // routing
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
