import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/FormConnection.dart';

class Connection extends StatefulWidget {
  const Connection({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<Connection> createState() => _Connection();
}

class _Connection extends State<Connection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connection')),
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Register'),
                  ),
                ],
              )),
          Container(
            child: FormConnection(),
          ),
        ],
      ),
    );
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }
  disconnect() {
    FirebaseAuth.instance.signOut();
  }
}
