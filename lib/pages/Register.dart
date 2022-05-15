import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_timer/components/FormRegister.dart';
import 'package:project_timer/models/User.dart' as MyUser;

class Register extends StatefulWidget {
  const Register({Key? key, this.title}) : super(key: key);


  final String? title;

  @override
  State<Register> createState(){
    return MyRegister();
  }
}


class MyRegister extends State<Register> {
  final _Register = GlobalKey<FormState>();
  final FormRegister form=FormRegister();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _Register,
      appBar: AppBar(title: Text('Création d \'un compte')),
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/connection');
                    },
                    child: const Text('connection'),
                  ),
                ],
              )),
          Container(
            child: form,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: ElevatedButton(
              onPressed: () {
                MyUser.User u = MyUser.User(mail: form.mail, pass: form.pass,);
                FirebaseFirestore.instance.collection('User').add(u.toJson());
                if (_Register.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Valider'),
            ),
          )],
      ),
    );
  }
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String pass,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
