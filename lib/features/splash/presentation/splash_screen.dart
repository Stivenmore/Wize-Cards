import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 24,
        children: [
          Center(
            child: Text(
              'Splash Screen',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
