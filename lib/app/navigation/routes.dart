import 'package:flutter/material.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/ui/screens/auth/auth_page.dart';
import 'package:fymoney/ui/screens/home/home_page.dart';
import 'package:fymoney/ui/screens/home/pages/c_settings/settings_page.dart';
import 'package:fymoney/ui/screens/splash_page.dart';

class CustomRouteObserver extends RouteObserver {}

final RouteObserver customRouterObserver = CustomRouteObserver();

typedef PathWidgetBuilder = Widget Function(BuildContext, String?, Object?);

class Path {
  final String pattern;
  final PathWidgetBuilder builder;
  const Path(this.pattern, this.builder);
}

class RoutesGenerator {
  static final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();

  static List<Path> paths = [
    Path(Routes.splash, (context, match, args) => const SplashPage()),
    Path(Routes.auth, (context, match, args) => const AuthPage()),
    Path(Routes.home, (context, match, args) => const HomePage()),
    Path(Routes.settings, (context, match, args) => const SettingsPage()),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      var name = settings.name;
      if (name != null) {
        if (regExpPattern.hasMatch(name)) {
          final firstMatch = regExpPattern.firstMatch(name);
          final match = firstMatch != null && (firstMatch.groupCount == 1)
              ? firstMatch.group(1)
              : null;
          return MaterialPageRoute<void>(
            builder: (context) =>
                path.builder(context, match, settings.arguments),
            settings: settings,
          );
        }
      }
    }

    return null;
  }
}
