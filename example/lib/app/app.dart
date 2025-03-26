import 'package:flutter/material.dart';
import 'package:flutter_security_toolkit_example/app/home_content.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeContent(),
    );
  }
}
