import 'package:customer_support/support_Centre.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Csstomer Support',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerSupportScreen(title: 'Customer Support Service'),
    );
  }
}
