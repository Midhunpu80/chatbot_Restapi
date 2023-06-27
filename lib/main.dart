import 'package:chat_bot/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  const key = "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";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'chat bot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Home(),
        ));
  }
}
