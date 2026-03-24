import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum AuthSessionStatus { unknown, authenticated, unauthenticated }

class AuthSessionNotifier extends ChangeNotifier {
  AuthSessionNotifier({required FirebaseAuth firebaseAuth}) {
    _subscription = firebaseAuth.authStateChanges().listen((user) {
      _status = user == null
          ? AuthSessionStatus.unauthenticated
          : AuthSessionStatus.authenticated;
      notifyListeners();
    });
  }

  late final StreamSubscription<User?> _subscription;
  AuthSessionStatus _status = AuthSessionStatus.unknown;

  AuthSessionStatus get status => _status;
  bool get isInitialized => _status != AuthSessionStatus.unknown;
  bool get isAuthenticated => _status == AuthSessionStatus.authenticated;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
