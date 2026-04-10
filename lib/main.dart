import 'package:authentication_app/src/add/ui.dart';
import 'package:authentication_app/src/local_storage/home_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TestHomeUiScreen(), //HomeUiScreen(),
      ),
    );
  }
}
