import 'package:flutter/material.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Магазин',
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> navigatorKey;
  AppRoutePath _path = AppRoutePath.home();

  @override
  AppRoutePath get currentConfiguration => _path;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: CartScreen(onProfileSelected: _showProfile)),
        if (_path.isProfile) MaterialPage(child: ProfileScreen(onBack: _showCart)),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _path = AppRoutePath.home();
        notifyListeners();
        return true;
      },
    );
  }

  void _showProfile() {
    _path = AppRoutePath.profile();
    notifyListeners();
  }

  void _showCart() {
    _path = AppRoutePath.home();
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _path = configuration;
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.home();
    } else if (uri.pathSegments.first == 'profile') {
      return AppRoutePath.profile();
    }
    return AppRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    switch (configuration.path) {
      case '/profile':
        return RouteInformation(location: '/profile');
      case '/':
      default:
        return RouteInformation(location: '/');
    }
  }
}

class AppRoutePath {
  final String path;

  AppRoutePath.home() : path = '/';
  AppRoutePath.profile() : path = '/profile';

  bool get isHome => path == '/';
  bool get isProfile => path == '/profile';
}