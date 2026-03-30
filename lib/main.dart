import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/core/router/auth_session_notifier.dart';
import 'package:wize_cards/core/router/route_generator.dart';
import 'package:wize_cards/core/theme/app_theme.dart';
import 'package:wize_cards/core/di/injection_container.dart' as di;
import 'package:wize_cards/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wize_cards/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:wize_cards/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();

  final authBloc = di.sl<AuthBloc>();
  final authSessionNotifier = AuthSessionNotifier(
    firebaseAuth: FirebaseAuth.instance,
  );

  runApp(MyApp(authBloc: authBloc, authSessionNotifier: authSessionNotifier));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required AuthBloc authBloc,
    required AuthSessionNotifier authSessionNotifier,
  }) : _authBloc = authBloc,
       _router = RouteGenerator.generateRouteWithGoRouter(authSessionNotifier);

  static const bool useGoRouter = true;
  final AuthBloc _authBloc;
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<StatsBloc>(create: (_) => StatsBloc()),
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
