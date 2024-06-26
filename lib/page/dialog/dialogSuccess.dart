import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(
            "assets/lottie/success.json",
            width: 150,
            height: 150,
            repeat: false,
          ),
          const SizedBox(height: 2),
          const Text(
            'Update Berhasil',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          
          const Text(
            'Data profile berhasil diperbaharui',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
          ),
          const SizedBox(height: 16),
          
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
        ],
      ),
    );
  }
}
