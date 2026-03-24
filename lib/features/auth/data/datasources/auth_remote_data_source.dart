import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wize_cards/core/error/exceptions.dart';
import 'package:wize_cards/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInAnonymously();
  Future<void> signOut();
  Future<UserModel> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw ServerException(message: 'Google sign in aborted by user.');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await firebaseAuth
          .signInWithCredential(credential);

      if (userCredential.user != null) {
        return UserModel.fromFirebaseUser(userCredential.user!);
      } else {
        throw ServerException(
          message: 'Failed to sign in with Google credential.',
        );
      }
    } on PlatformException catch (e) {
      final details = '${e.message ?? e.details ?? 'Unknown platform error'}';
      debugPrint(
        'Google Sign-In PlatformException: code=${e.code}, details=$details',
      );

      if (e.code == 'sign_in_failed' &&
          (details.contains('ApiException: 10') ||
              details.contains('DEVELOPER_ERROR'))) {
        throw ServerException(
          message:
              'Google Sign-In failed (DEVELOPER_ERROR). Check Android OAuth setup in Firebase: package name and SHA-1/SHA-256 fingerprints, then regenerate google-services.json.',
        );
      }

      throw ServerException(
        message: 'Google Sign-In platform error (${e.code}): $details',
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(
        'FirebaseAuthException during Google Sign-In: code=${e.code}, message=${e.message}',
      );
      throw ServerException(
        message:
            'Firebase auth error (${e.code}): ${e.message ?? 'Unknown Firebase auth error'}',
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signInAnonymously() async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInAnonymously();

      if (userCredential.user != null) {
        return UserModel.fromFirebaseUser(userCredential.user!);
      }

      throw ServerException(message: 'Failed to sign in anonymously.');
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        message:
            'Firebase auth error (${e.code}): ${e.message ?? 'Unknown Firebase auth error'}',
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([firebaseAuth.signOut(), googleSignIn.signOut()]);
    } catch (e) {
      throw ServerException(message: 'Failed to sign out.');
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      return UserModel.fromFirebaseUser(user);
    } else {
      throw ServerException(message: 'No user currently signed in.');
    }
  }
}
