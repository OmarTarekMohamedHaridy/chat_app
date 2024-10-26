import 'package:chat_ap/screens/create_Account/create_Account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      initialRoute: CreateAccountScreen.RouteName,
      routes: {
  CreateAccountScreen.RouteName:(context)=>CreateAccountScreen(),
      },
    );

  }
}

