import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_timer/components/FormRegister.dart';

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
            child: FormRegister(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: ElevatedButton(
              onPressed: () {
                /*User u = User(name: name, age: age);
                FirebaseFirestore.instance.collection('User').add();*/
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
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
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
