import 'package:flutter/material.dart';
import 'package:razorpay_payments/screens/home_screen.dart';
import 'package:razorpay_payments/screens/payment_screen.dart';
import 'package:razorpay_payments/utils/constant_strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: RAZORPAY_PAYMENT_STRING,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PaymentScreen(),
      home: const HomeScreen(),
    );
  }
}
