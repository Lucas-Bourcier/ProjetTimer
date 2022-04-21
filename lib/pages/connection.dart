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
}
