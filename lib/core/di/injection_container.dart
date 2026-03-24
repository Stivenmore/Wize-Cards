import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:wize_cards/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:wize_cards/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:wize_cards/features/auth/domain/repositories/auth_repository.dart';
import 'package:wize_cards/features/auth/domain/usecases/get_current_user.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_in_anonymously.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:wize_cards/features/auth/domain/usecases/sign_out.dart';
import 'package:wize_cards/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ===========================================================================
  // 1. EXTERNAL (Paquetes de terceros y Core)
  // Lo más bajo en la cadena de dependencias.
  // No lo vamos a usar en WizeCard
  // ===========================================================================
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

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

  // ===========================================================================
  // 3. REPOSITORIES
  // Orquestan Data Sources (Remote/Local) y mapean a Entities del Domain.
  // ===========================================================================
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // ===========================================================================
  // 4. USE CASES
  // Lógica de negocio pura. Un caso de uso por acción.
  // ===========================================================================
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignInAnonymously(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));

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
}
