import 'package:project_timer/models/Timer.dart';
import 'package:flutter/widgets.dart';

class TimerModel extends ChangeNotifier{
  final List<Timer> _timers = List.empty(growable: true);

  get getTimer {
    return _timers;
  }

  addTimer(String name, int duree, String description, bool statut, bool visible, int ordre, DateTime activationDate) {
    Timer t=Timer(name: name, duree: duree, description: description, statut: statut, visible: visible, ordre: ordre);
    t.activationDate=activationDate;
    _timers.add(t);
    notifyListeners();
  }

  updateTimer(int index,String newName, int newDuree, String newDescription, bool newStatut, bool newVisible, int newOrdre, DateTime newActivationDate) {
    _timers[index].name = newName;
    _timers[index].duree = newDuree;
    _timers[index].description = newDescription;
    _timers[index].statut = newStatut;
    _timers[index].visible = newVisible;
    _timers[index].ordre = newOrdre;
    _timers[index].activationDate = newActivationDate;
    notifyListeners();
  }

  insertOrUpdateTimer(int index,String newName,int newDuree, String newDescription, bool newStatut, bool newVisible, int newOrdre, DateTime newActivationDate) {
    if (index == -1) {
      addTimer(newName, newDuree, newDescription, newStatut, newVisible, newOrdre, newActivationDate);
    } else {
      updateTimer(index, newName,newDuree, newDescription, newStatut, newVisible, newOrdre, newActivationDate);
    }
  }

  deleteTimer(int index) {
    _timers.removeAt(index);
    notifyListeners();
  }

}