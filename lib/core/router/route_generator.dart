import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wize_cards/core/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:wize_cards/core/router/app_routes.dart';
import 'package:wize_cards/features/deck/deck_screen.dart';
import 'package:wize_cards/features/deck_details/presentation/deck_details_screen.dart';
import 'package:wize_cards/features/deck_creation/presentation/deck_creation_screen.dart';
import 'package:wize_cards/features/login/presentation/login_screen.dart';
import 'package:wize_cards/features/onboarding/presentation/onboarding_screen.dart';
import 'package:wize_cards/features/search/presentation/search_screen.dart';
import 'package:wize_cards/features/splash/presentation/splash_screen.dart';

class RouteGenerator {
  static GoRouter generateRouteWithGoRouter() {
    return GoRouter(
      initialLocation: AppRoutes.splash,
      routes: [
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.createDeck,
          builder: (context, state) => const DeckCreationScreen(),
        ),
        GoRoute(
          path: AppRoutes.deckDetail,
          builder: (context, state) => _buildDeckDetailsScreen(),
        ),
        GoRoute(
          path: AppRoutes.studyMode,
          builder: (context, state) =>
              _errorScreen(message: 'Study mode requiere deckId en la ruta.'),
        ),
        GoRoute(
          path: '${AppRoutes.studyMode}/:deckId',
          builder: (context, state) {
            final deckId = state.pathParameters['deckId'];
            if (deckId == null || deckId.isEmpty) {
              return _errorScreen(
                message: 'Study mode requiere deckId válido.',
              );
            }

            /*
            return StudyModeScreen(deckId: deckId);
            */

            return _errorScreen(
              message: 'Study mode aún no está implementado.',
            );
          },
        ),

        StatefulShellRoute.indexedStack(
          builder: (_, _, navigationShell) =>
              CustomBottomNavigationBar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.decks,
                  builder: (_, _) => const DeckScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.search,
                  builder: (_, _) => const SearchScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.stats,
                  builder: (_, _) => _errorScreen(
                    message: 'La pantalla Stats aún no está implementada.',
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.profile,
                  builder: (_, _) => _errorScreen(
                    message: 'La pantalla Profile aún no está implementada.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) {
        return _errorScreen(
          message: 'Ruta no encontrada: ${state.uri.toString()}',
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Los argumentos se recuperan de settings.arguments
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case AppRoutes.decks:
      //  return MaterialPageRoute(builder: (_) => const DecksScreen());

      case AppRoutes.deckDetail:
        return MaterialPageRoute(builder: (_) => _buildDeckDetailsScreen());

      case AppRoutes.studyMode:
        if (args is String) {
          /* return MaterialPageRoute(
            builder: (_) => StudyModeScreen(deckId: args),
          );*/
        }
        return _errorRoute();

      case AppRoutes.createDeck:
        return MaterialPageRoute(builder: (_) => const DeckCreationScreen());

      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case AppRoutes.stats:
      //  return MaterialPageRoute(builder: (_) => const StatsScreen());

      case AppRoutes.profile:
      //  return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => _errorScreen());
  }

  static DeckDetailsScreen _buildDeckDetailsScreen() {
    return DeckDetailsScreen(
      title: 'Business English B2',
      createdBy: 'HR Team',
      description:
          'Essential vocabulary for international business meetings, negotiations, and formal correspondence.',
      cardCount: 50,
      language: 'EN-US',
      lastEdited: DateTime.now().subtract(const Duration(days: 2)),
      cards: const [
        CardPreviewData(
          term: 'Stakeholder',
          definition:
              'A person with an interest or concern in something, especially a business.',
        ),
        CardPreviewData(
          term: 'ROI (Return on Investment)',
          definition:
              'A performance measure used to evaluate the efficiency of an investment.',
        ),
        CardPreviewData(
          term: 'Net Profit',
          definition:
              'The actual profit after working expenses not included in the calculation of gross profit have been paid.',
        ),
      ],
    );
  }

  static Scaffold _errorScreen({String message = 'Ruta no encontrada'}) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text(message, textAlign: TextAlign.center)),
    );
  }
}
