import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_timer/models/User.dart';
import 'package:project_timer/pages/Grid.dart';
import 'package:project_timer/pages/Register.dart';
import 'package:project_timer/pages/Timer.dart';
import 'package:project_timer/pages/connection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const config = FirebaseOptions(
      apiKey: "AIzaSyAOPBNojHrFAAqp10l-ui87S_loeUGd91I",
      appId: "1:359794135099:web:ecd5f6fe3ab1a9ff85cc1e",
      messagingSenderId: "359794135099",
      projectId: "projettimer");
  await Firebase.initializeApp(options: config);
  log(FirebaseDatabase.instance.toString());

  Future<void> getData() async {
    final querySnapshot = await UserCollectionReference().get();
    final allUsers =
        querySnapshot.docs.map((userData) => userData.data).toList();
    log(allUsers.toString());
  }

  await getData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crono',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Timer(title: 'Crono'),
        '/grid': (context) => const GridTemplate(title: 'Crono'),
        '/connection': (context) => Connection(title: 'Crono'),
        '/register': (context) => Register(title: 'Crono')
      },
    );
  }
}
