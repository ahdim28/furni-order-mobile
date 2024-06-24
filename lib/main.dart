import 'package:flutter/material.dart';
import 'package:furni_order/views/auth/loginPage.dart';

void main() {
  runApp(const FurniOrderApp());
}

class FurniOrderApp extends StatelessWidget {
  const FurniOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: const LoginPage(),
    );
  }
}
