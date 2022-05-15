import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:project_timer/components/TimerList.dart';
import 'package:project_timer/models/Timer.dart';

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
                      }return null;
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
                  Timer u = Timer(name: nameController.text,description: descriptionController.text,duree: int.parse(timeController.text),ordre: ordre,statut: statut,visible: visible);
                  FirebaseFirestore.instance.collection('Timer').add(u.toJson());
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
                      onPressed: () {},
                      text: 'Ajouter groupe',
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: const Color.fromRGBO(72, 70, 70, 1.0)),
                  const SizedBox(width: 10),
                  GFButton(
                      onPressed: () {},
                      text: 'Ajouter trame',
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: const Color.fromRGBO(72, 70, 70, 1.0)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: GFCard(
                  title: GFListTile(
                    title: const Text(
                      "GROUPE 1",
                      style: TextStyle(color: Colors.white),
                    ),
                    subTitle: GFButtonBar(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      children: [
                        GFButton(
                            onPressed: () {_confirmationClearList(context);},
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
                    ],
                  )),
            ),
          ],
        )));
  }
}
