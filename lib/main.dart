import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/screens/splash_screen.dart';
import 'package:calculator/controllers/history_controller.dart';

void main() {
  Get.put(HistoryController()); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Calculator',
      home: SplashScreen(),
    );
  }
}
