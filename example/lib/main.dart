import 'package:flutter/material.dart';
import 'package:instant_preview_arkit_arcore/instant_preview_arkit_arcore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _instantPreviewArkitArcorePlugin = InstantPreviewArkitArcore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            child: const Text('AR'),
            onPressed: () async {
              _chamarAr();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _chamarAr() async {
    try {
      final result = await _instantPreviewArkitArcorePlugin.showPreviewArLocal(
          path: 'abacaxi');
    } catch (e) {
      print(e);
    }
  }
}
