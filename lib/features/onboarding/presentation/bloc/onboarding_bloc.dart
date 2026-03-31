import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wize_cards/core/usecases/usecase.dart';
import 'package:wize_cards/features/onboarding/domain/usecases/check_onboarding_completed.dart';
import 'package:wize_cards/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:wize_cards/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:wize_cards/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final CheckOnboardingCompleted _checkOnboardingCompleted;
  final CompleteOnboarding _completeOnboarding;

  OnboardingBloc({
    required CheckOnboardingCompleted checkOnboardingCompleted,
    required CompleteOnboarding completeOnboarding,
  }) : _checkOnboardingCompleted = checkOnboardingCompleted,
       _completeOnboarding = completeOnboarding,
       super(OnboardingInitial()) {
    on<OnboardingCheckRequested>(_onCheckRequested);
    on<OnboardingCompleted>(_onCompleted);
  }

  Future<void> _onCheckRequested(
    OnboardingCheckRequested event,
    Emitter<OnboardingState> emit,
  ) async {
    final result = await _checkOnboardingCompleted(NoParams());
    result.fold(
      (failure) => emit(OnboardingRequired()),
      (hasCompleted) =>
          hasCompleted ? emit(OnboardingDone()) : emit(OnboardingRequired()),
    );
  }

  Future<void> _onCompleted(
    OnboardingCompleted event,
    Emitter<OnboardingState> emit,
  ) async {
    final result = await _completeOnboarding(NoParams());
    result.fold(
      (failure) => emit(OnboardingError(failure.message)),
      (_) => emit(OnboardingDone()),
    );
  }
}
