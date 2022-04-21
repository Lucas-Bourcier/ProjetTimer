import 'package:flutter/material.dart';
import 'package:project_timer/components/FormRegister.dart';

class Register extends StatefulWidget {
  const Register({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
