import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wize_cards/core/usecases/usecase.dart';
import 'package:wize_cards/features/auth/domain/usecases/get_current_user.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_in_anonymously.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_out.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_event.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser _getCurrentUser;
  final SignInWithGoogle _signInWithGoogle;
  final SignInAnonymously _signInAnonymously;
  final SignOut _signOut;

  AuthBloc({
    required GetCurrentUser getCurrentUser,
    required SignInWithGoogle signInWithGoogle,
    required SignInAnonymously signInAnonymously,
    required SignOut signOut,
  }) : _getCurrentUser = getCurrentUser,
       _signInWithGoogle = signInWithGoogle,
       _signInAnonymously = signInAnonymously,
       _signOut = signOut,
       super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthGoogleSignInRequested>(_onAuthGoogleSignInRequested);
    on<AuthAnonymousSignInRequested>(_onAuthAnonymousSignInRequested);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _getCurrentUser(NoParams());
    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onAuthGoogleSignInRequested(
    AuthGoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signInWithGoogle(NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signOut(NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> _onAuthAnonymousSignInRequested(
    AuthAnonymousSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signInAnonymously(NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }
}
