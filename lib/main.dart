import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/core/router/route_generator.dart';
import 'package:wize_cards/core/theme/app_theme.dart';
import 'package:wize_cards/core/di/injection_container.dart' as di;
import 'package:wize_cards/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_event.dart';
import 'package:wize_cards/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const bool useGoRouter = true;
  static final _router = RouteGenerator.generateRouteWithGoRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>()..add(AuthCheckRequested()),
        ),
      ],
      child: useGoRouter
          ? MaterialApp.router(
              title: 'WizeCards',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              themeMode: ThemeMode.light,
              routerConfig: _router,
            )
          : MaterialApp(
              title: 'WizeCards',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              themeMode: ThemeMode.light,
              initialRoute: AppRoutes.splash,
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
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
