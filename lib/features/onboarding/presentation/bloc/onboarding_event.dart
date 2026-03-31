import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

/// Verifica si el usuario ya completo el onboarding.
class OnboardingCheckRequested extends OnboardingEvent {}

/// El usuario completo el onboarding (skip o get started).
class OnboardingCompleted extends OnboardingEvent {}
