import 'package:flutter/cupertino.dart';
import 'package:tozauz_agent/features/main_screen.dart';
import 'package:tozauz_agent/features/onboarding/splash/splash_screen.dart';

import '../../features/onboarding/no_internet/no_internet_screen.dart';
import 'app_routes.dart';

class RouteGenerate {
  Route? generate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      /// PROJECT ///

      case AppRoutes.splashScreen:
        return simpleRoute(const SplashScreen());

      case AppRoutes.noInternet:
        return simpleRoute(const NoInternetScreen());
      case AppRoutes.mainScreen:
        return simpleRoute(const MainScreen());
    }
    return null;
  }

  simpleRoute(Widget route) => CupertinoPageRoute(builder: (context) => route);
}
