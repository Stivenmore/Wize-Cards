import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wize_cards/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:wize_cards/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:wize_cards/features/auth/domain/repositories/auth_repository.dart';
import 'package:wize_cards/features/auth/domain/usecases/get_current_user.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_in_anonymously.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_out.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wize_cards/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:wize_cards/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:wize_cards/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:wize_cards/features/onboarding/domain/usecases/check_onboarding_completed.dart';
import 'package:wize_cards/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:wize_cards/features/onboarding/presentation/bloc/onboarding_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ===========================================================================
  // 1. EXTERNAL (Paquetes de terceros y Core)
  // Lo más bajo en la cadena de dependencias.
  // No lo vamos a usar en WizeCard
  // ===========================================================================
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // ===========================================================================
  // 2. DATA SOURCES
  // Hablan directamente con los paquetes externos.
  // ===========================================================================
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    ),
  );
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // ===========================================================================
  // 3. REPOSITORIES
  // Orquestan Data Sources (Remote/Local) y mapean a Entities del Domain.
  // ===========================================================================
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(localDataSource: sl()),
  );

  // ===========================================================================
  // 4. USE CASES
  // Lógica de negocio pura. Un caso de uso por acción.
  // ===========================================================================
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignInAnonymously(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => CheckOnboardingCompleted(sl()));
  sl.registerLazySingleton(() => CompleteOnboarding(sl()));

  // ===========================================================================
  // 5. BLOCS / PRESENTATION
  // Consumen los Use Cases. Usamos Factory para que el estado se reinicie
  // si el widget se destruye y se vuelve a montar.
  // ===========================================================================
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      getCurrentUser: sl(),
      signInWithGoogle: sl(),
      signInAnonymously: sl(),
      signOut: sl(),
    ),
  );
  sl.registerFactory<OnboardingBloc>(
    () => OnboardingBloc(
      checkOnboardingCompleted: sl(),
      completeOnboarding: sl(),
    ),
  );
}
