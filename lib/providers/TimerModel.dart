import 'dart:ffi';

import 'package:project_timer/database/Timer_local.dart';
import 'package:flutter/widgets.dart';

class TimerModel extends ChangeNotifier{
  final List<Timer> _timers = List.empty(growable: true);

  get getTimer {
    return _timers;
  }

  addTimer(String name, int duree, String description, String statut, Bool visible, int ordre, DateTime dateActivation) {
    _timers.add(Timer(name: name, duree: duree, description: description, statut: statut, visible: visible, ordre: ordre, dateActivation: dateActivation));
    notifyListeners();
  }

  updateTimer(int index,String newName, int newDuree, String newDescription, String newStatut, Bool newVisible, int newOrdre, DateTime newDateActivation) {
    _timers[index].name = newName;
    _timers[index].duree = newDuree;
    _timers[index].description = newDescription;
    _timers[index].statut = newStatut;
    _timers[index].visible = newVisible;
    _timers[index].ordre = newOrdre;
    _timers[index].dateActivation = newDateActivation;
    notifyListeners();
  }

  insertOrUpdateTimer(int index,String newName,int newDuree, String newDescription, String newStatut, Bool newVisible, int newOrdre, DateTime newDateActivation) {
    if (index == -1) {
      addTimer(newName, newDuree, newDescription, newStatut, newVisible, newOrdre, newDateActivation);
    } else {
      updateTimer(index, newName,newDuree, newDescription, newStatut, newVisible, newOrdre, newDateActivation);
    }
  }

  deleteTimer(int index) {
    _timers.removeAt(index);
    notifyListeners();
  }

}