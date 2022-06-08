import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_timer/components/TimerList.dart';
import 'package:project_timer/models/Groupe.dart';
import 'package:project_timer/models/Timer.dart';

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<GroupeQuerySnapshot>(
        ref: groupesRef,
        builder: (context, AsyncSnapshot<GroupeQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {
            log(snapshot.error.toString());
          }
          if (!snapshot.hasData) return const Text('Loading users...');

          // Access the QuerySnapshot
          GroupeQuerySnapshot querySnapshot = snapshot.requireData;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              Groupe groupe = querySnapshot.docs[index].data;
              return Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: GFCard(
                        title: GFListTile(
                          title: Text(
                            groupe.libelle,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subTitle: GFButtonBar(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                            children: [
                              GFButton(
                                  onPressed: () {
                                    _confirmationClearList(context);
                                  },
                                  text: 'Ajouter timer',
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  color: const Color.fromRGBO(72, 70, 70, 1.0)),
                            ],
                          ),
                        ),
                        color: const Color.fromRGBO(47, 47, 47, 1.0),
                        content: Column(
                          children: [
                            TimersList(),
                            GFButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Groupe')
                                      .doc(querySnapshot.docs[index].id)
                                      .delete();
                                },
                                text: 'Supprimer groupe',
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                color: const Color.fromRGBO(72, 70, 70, 1.0)),
                          ],
                        )),
                  ),
                ],
              );
            },
          );
        });
  }

  Widget _button(
      {required String title,
      required IconData icon,
      VoidCallback? onPressed}) {
    return Container(
        child: GFButton(
      color: const Color.fromRGBO(79, 125, 174, 1.0),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      icon: Icon(icon, color: Colors.white),
      size: GFSize.SMALL,
    ));
  }
}

Future<void> _confirmationClearList(context) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  int duree = 10;
  int ordre = 0;
  bool visible = false;
  bool statut = false;
  String selectedValue = "One";

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nom du timer'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: nameController,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration:
                        InputDecoration(labelText: 'Description du timer'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  TextFormField(
                    controller: timeController,
                    decoration: InputDecoration(labelText: 'Temps du timer'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),

                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('CONFIRM'),
                onPressed: () {
                  Timer u = Timer(
                      name: nameController.text,
                      description: descriptionController.text,
                      duree: int.parse(timeController.text),
                      ordre: ordre,
                      statut: statut,
                      visible: visible);
                  FirebaseFirestore.instance
                      .collection('Timer')
                      .add(u.toJson());
                  //FirebaseFirestore.instance.collection('Timer').doc(Timer.uid).delete(); //ca fonctionne pas mais oklm
                  Navigator.pop(context);
                },
              )
            ]);
      });
}
