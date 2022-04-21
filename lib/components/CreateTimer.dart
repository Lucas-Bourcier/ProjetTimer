// ne pas toucher ca peut être utile merci.

import 'dart:developer';

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_timer/models/Timer.dart';

class CreateTimer extends StatelessWidget {
  double _valueSliderTime = 10;
  bool isCheckedBox = false;
  bool isCheckedSwitch = false;
  String DropDownValue = "One";

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<TimerQuerySnapshot>(
        ref: timersRef,
        builder: (context, AsyncSnapshot<TimerQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {
            log(snapshot.error.toString());
          }
          if (!snapshot.hasData) return const Text('Loading users...');

          // Access the QuerySnapshot
          TimerQuerySnapshot querySnapshot = snapshot.requireData;

          return Container(
            height: MediaQuery.of(context).size.height / 2,
            child: GFCard(
              titlePosition: GFPosition.start,
              title: GFListTile(
                titleText: 'Création d\'un timer',
                subTitleText: '* champs réquis',
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Nom du timer'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  Slider(
                    value: _valueSliderTime,
                    max: 1440,
                    label: _valueSliderTime.round().toString(),
                    onChanged: (double value) {
                      _valueSliderTime = value;
                    },
                  ),
                  Checkbox(
                      value: isCheckedBox,
                      onChanged: (bool? value) {
                        isCheckedBox = value!;
                      }),
                  Switch(
                      value: isCheckedSwitch,
                      onChanged: (bool? value) {
                        isCheckedSwitch = value!;
                      }),
                  DropdownButton<String>(
                    value: DropDownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      DropDownValue = newValue!;
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
          );
        });
  }
}
