// ne pas toucher ca peut être utile merci.

import 'dart:developer';

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_timer/models/Groupe.dart';

bool isCheckedSwitch = false;
String DropDownValue = "One";

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

        return Container(
          height: MediaQuery.of(context).size.height / 2,
          child: GFCard(
            titlePosition: GFPosition.start,
            title: const GFListTile(
              titleText: 'Création d\'un group',
              subTitleText: '* champs réquis',
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TextField(
                  decoration: InputDecoration(labelText: 'Nom du groupe'),
                ),
              ],
            ),
          ),
        );
      });
}
