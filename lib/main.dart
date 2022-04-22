import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_timer/models/User.dart';
import 'package:project_timer/pages/Grid.dart';
import 'package:project_timer/pages/Register.dart';
import 'package:project_timer/pages/Timer.dart';
import 'package:project_timer/pages/connection.dart';

import 'components/FormConnection.dart';

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

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF2f2f2f, color);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crono',
      theme: ThemeData(
        primarySwatch: colorCustom,
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

// Ajout pour le user pas encore fix au niveau des bug.
/*class StateFormConnection extends State<StatefulWidget>{
  @override
  int _counter = 0;
  String _currentUsername = "";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 4,
          MediaQuery.of(context).size.height / 5,
          MediaQuery.of(context).size.width / 4,
          MediaQuery.of(context).size.height / 5),
      child: GFCard(
        titlePosition: GFPosition.start,
        title: GFListTile(
          titleText: 'Connection',
          subTitleText: '* champs requis',
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text('Adresse Mail : *'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 50),
              child: TextField(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text('Mot de passe : *'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextField(),
            ),
          ],
        ),
      ),
    );
  }
  testConnection(String emailAddress, String password) async {

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      setState(() {
        _currentUsername = FirebaseAuth.instance.currentUser!.email??'';
      });

      /*Navigator.pushNamed(context, UserPage.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }*/

  disconnect() {
    FirebaseAuth.instance.signOut();
    setState(() {
      _currentUsername='';
    });
  }

  checkConnection() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }**/
