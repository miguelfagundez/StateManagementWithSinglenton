import 'package:flutter/material.dart';
import 'package:flutter_state_management_singlenton/screens/home_screen.dart';
import 'package:flutter_state_management_singlenton/screens/random_screen.dart';

void main() {
  runApp(const MyApp());
}

//************************************************************
// MyApp class
// Author: Miguel Fagundez
// Date: May, 27 2022
// MyApp
//************************************************************
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto State Managment - Singlenton',
      initialRoute: 'home_crypto',
      routes: {
        'home_crypto': (_) => const HomeScreen(),
        'random_crypto': (_) => const RandomScreen()
      },
    );
  }
}
