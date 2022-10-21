import 'package:basic_banking_app/modules/bank_layout/bank_layout_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.indigo,
          appBarTheme: AppBarTheme(
        color: Colors.indigo,
      )),
      home: BankLayoutScreen(),
    );
  }
}

