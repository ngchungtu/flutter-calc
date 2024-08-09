import 'package:calc_app/components/CalcBasicView.dart';
import 'package:calc_app/components/CalcView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calc Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //calc _ver1
      // home: const CalcView(),

      //calc _ver basic
      home: const CalcBasicView(),
    );
  }
}