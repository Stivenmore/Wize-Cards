import 'package:equatable/equatable.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

/// Estado inicial antes de verificar.
class OnboardingInitial extends OnboardingState {}

/// El usuario NO ha completado el onboarding, debe verlo.
class OnboardingRequired extends OnboardingState {}

/// El usuario YA completo el onboarding, ir a login.
class OnboardingDone extends OnboardingState {}

/// Error al leer/escribir el estado del onboarding.
class OnboardingError extends OnboardingState {
  final String message;

  const OnboardingError(this.message);

  @override
  List<Object?> get props => [message];
}
