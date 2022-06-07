import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:project_timer/models/Groupe.dart';
import 'package:project_timer/models/Timer.dart';

import '../components/GroupList.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<TimerPage> createState() => _Timer();
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
                  Checkbox(
                      value: visible,
                      onChanged: (bool? value) {
                        visible = value!;
                      }),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.deepPurpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.deepPurpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.deepPurpleAccent,
                    ),
                    dropdownColor: Colors.deepPurpleAccent,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      selectedValue = newValue!;
                      print(selectedValue);
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
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

class _Timer extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: [
                  GFButton(
                      onPressed: () {
                        _confirmationCreateGroup(context);
                      },
                      text: 'Ajouter groupe',
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: const Color.fromRGBO(72, 70, 70, 1.0)),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GroupList(),
                ),
              ],
            )
          ],
        )));
  }
}

Future<void> _confirmationCreateGroup(context) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String libelle = "test";

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
                    decoration:
                        const InputDecoration(labelText: 'Nom du groupe'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: nameController,
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
                  Groupe u = Groupe(libelle: nameController.text);
                  FirebaseFirestore.instance
                      .collection('Groupe')
                      .add(u.toJson());
                  //FirebaseFirestore.instance.collection('Timer').doc(Timer.uid).delete(); //ca fonctionne pas mais oklm
                  Navigator.pop(context);
                },
              )
            ]);
      });
}
