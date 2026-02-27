import 'package:flutter/material.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/features/splash/presentation/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Los argumentos se recuperan de settings.arguments
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.login:
      //  return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.decks:
      //  return MaterialPageRoute(builder: (_) => const DecksScreen());

      case AppRoutes.deckDetail:
        // Validación de argumentos para el mazo seleccionado
        if (args is String) {
          /*return MaterialPageRoute(
            builder: (_) => DeckDetailScreen(deckId: args),
          );*/
        }
        return _errorRoute();

      case AppRoutes.studyMode:
        if (args is String) {
          /* return MaterialPageRoute(
            builder: (_) => StudyModeScreen(deckId: args),
          );*/
        }
        return _errorRoute();

      case AppRoutes.createDeck:
      // return MaterialPageRoute(builder: (_) => const CreateDeckScreen());

      case AppRoutes.stats:
      //  return MaterialPageRoute(builder: (_) => const StatsScreen());

      case AppRoutes.profile:
      //  return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('Ruta no encontrada')),
        );
      },
    );
  }
}
