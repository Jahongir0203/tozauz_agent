import 'package:flutter/cupertino.dart';
import '../../export.dart';

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
      case AppRoutes.containerDetailScreen:
        var data = settings.arguments as Map<String, dynamic>;
        return simpleRoute(
          ContainerDetailScreen(
            box: data["name"],
            id: data['id'],
          ),
        );
      case AppRoutes.loginScreen:
        return simpleRoute(const LoginScreen());
    }
    return null;
  }

  simpleRoute(Widget route) => CupertinoPageRoute(builder: (context) => route);
}
