import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      // Use a Consumer so MaterialApp's theme reacts to MyAppState.seedColor
      child: Consumer<MyAppState>(
        builder: (context, appState, _) => MaterialApp(
          title: "Drop words",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: appState.seedColor),
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // seedColor controls the app's color theme. Initialize randomly.
  Color seedColor = _randomColor();

  static Color _randomColor() {
    final rnd = Random();
    return Color.fromARGB(
      255,
      rnd.nextInt(256),
      rnd.nextInt(256),
      rnd.nextInt(256),
    );
  }

  // function to get next word
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // Change the theme to a new random color
  void randomizeTheme() {
    seedColor = _randomColor();
    notifyListeners();
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: TextStyle(fontSize: 32, color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('A random word:'),
            SizedBox(height: 12),
            BigCard(pair: pair),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                appState.getNext();
                appState.randomizeTheme();
                print("Button pressed!, Generated word: ${appState.current}");
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
