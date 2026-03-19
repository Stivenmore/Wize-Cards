import 'package:flutter/material.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/core/router/route_generator.dart';
import 'package:wize_cards/core/theme/app_theme.dart';
//import 'package:flutter/widget_previews.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const bool useGoRouter = true;
  static final _router = RouteGenerator.generateRouteWithGoRouter();

  @override
  Widget build(BuildContext context) {
    if (useGoRouter) {
      return MaterialApp.router(
        title: 'WizeCards',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: .light,
        routerConfig: _router,
      );
    }

    return MaterialApp(
      title: 'WizeCards',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: .light,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

/*
// Preview Visualizator
@Preview()
Widget previewWizeCardsStarter() {
  return Container(
    color: Colors.white,
    child: Center(child: Text('WizeCards Workshop Starter Now')),
  );
}
*/
