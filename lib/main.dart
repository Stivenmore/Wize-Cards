import 'package:flutter/material.dart';
//import 'package:flutter/widget_previews.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WizeCards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1976D2)),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(child: Text('WizeCards Workshop Starter')),
      ),
    );
  }
}

/*
// Preview Visualizator
@Preview()
Widget previewWizeCardsStarter() {
  return Container(
    color: Colors.white,
    child: Center(child: Text('WizeCards Workshop Starter')),
  );
}
*/
