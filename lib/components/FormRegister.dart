import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class FormRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return FirestoreBuilder<TimerQuerySnapshot>(
        ref: timersRef,
        builder: (context, AsyncSnapshot<TimerQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {
            log(snapshot.error.toString());
          }
          if (!snapshot.hasData) return const Text('Loading users...');

          // Access the QuerySnapshot
          TimerQuerySnapshot querySnapshot = snapshot.requireData;*/

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 4,
          MediaQuery.of(context).size.height / 5,
          MediaQuery.of(context).size.width / 4,
          MediaQuery.of(context).size.height / 5),
      child: GFCard(
        titlePosition: GFPosition.start,
        title: GFListTile(
          titleText: 'Connection',
          subTitleText: '* champs réquis',
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text('Adresse mail : *'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Adresse Mail',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text('Mot de passe : *'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                decoration: const InputDecoration(
                  labelText: 'Mot De Passe',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text('Confirmer le mot de passe : *'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Confirmer le Mot De Passe',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
