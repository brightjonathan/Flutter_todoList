import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Screen/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// MYAPP Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle( statusBarColor: Colors.transparent )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Home()
     );
  }
}

