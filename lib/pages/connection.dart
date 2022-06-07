import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/FormConnection.dart';
import 'package:project_timer/models/User.dart' as MyUser;



class Connection extends StatefulWidget {
  const Connection({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<Connection> createState(){
    return MyConnection();
  }
}

class MyConnection extends State<Connection> {
  final _connection = GlobalKey<FormState>();
  final FormConnection form=FormConnection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _connection,
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
            child: form,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: ElevatedButton(
              onPressed: () async {
                MyUser.User u = MyUser.User(mail: form.mail, pass: form.pass);
                FirebaseFirestore.instance.collection('User').where({'mail':u.mail,'pass':u.pass});
              },
              child: const Text('Valider'),
            ),
          )],
      ),
    );
  }
  //Sign in with email and password
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user!;
    } catch (e) {
      print(e.toString());
      return ;
    }
  }
}
