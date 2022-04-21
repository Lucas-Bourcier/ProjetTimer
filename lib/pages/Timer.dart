import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:project_timer/components/TimerList.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<Timer> createState() => _Timer();
}

Future<void> _confirmationClearList(context) async {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String description = "";
  String duree = "";
  int ordre = 0;
  DateTime activationDate = DateTime.now();
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
                      return value = name;
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Description du timer'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return value = description;
                    },
                  ),
                  TextFormField(
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
                      return value = duree;
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
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
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
                  // timer.addTimer(name, duree.hashCode, description, statut,
                  //     visible, ordre, activationDate);
                  Navigator.pop(context);
                },
              )
            ]);
      });
}

class _Timer extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 0,
                    child: OutlinedButton(
                      onPressed: () {
                        _confirmationClearList(context);
                      },
                      child: const Text('Ajouter un Timer'),
                    )),
                GFCard(
                  title: GFListTile(
                    title: Text(
                      "GROUPE 1",
                      style: TextStyle(color: Colors.white),
                    ),
                    subTitle: GFButtonBar(
                      children: [
                        GFButton(
                            onPressed: () {},
                            text: 'Ajouter timer',
                            icon: Icon(Icons.add),
                            color: const Color.fromRGBO(72, 70, 70, 1.0)),
                        GFButton(
                            onPressed: () {},
                            text: 'Ajouter trame',
                            icon: Icon(Icons.add),
                            color: const Color.fromRGBO(72, 70, 70, 1.0)),
                      ],
                    ),
                  ),
                  color: const Color.fromRGBO(47, 47, 47, 1.0),
                  content: TimersList(),
                )
              ],
            ),
          ),
        ));
  }
}
