import 'package:flutter/material.dart';

import 'src/navigation/navigation.dart';
import 'src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Tree Viewer',
      theme: createTheme(),
      routes: AppNav.routes,
    );
  }
}
