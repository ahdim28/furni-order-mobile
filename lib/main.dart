import 'package:flutter/material.dart';
import 'package:furni_order/page/widget/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/cart_controller.dart';

void main() {
  runApp(const FurniOrderApp());
}

class FurniOrderApp extends StatelessWidget {
  const FurniOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme: GoogleFonts.jostTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
