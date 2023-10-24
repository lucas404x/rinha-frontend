import 'package:flutter/widgets.dart';

import '../screens/home/home_screen.dart';

abstract final class Routes {
  static const String home = '/';
}

abstract final class AppNav {
  static final routes = <String, WidgetBuilder>{
    Routes.home: (context) => const HomeScreen(),
  };
}