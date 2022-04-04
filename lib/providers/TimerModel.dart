import 'package:project_timer/database/Timer.dart';
import 'package:flutter/widgets.dart';

class TimerModel extends ChangeNotifier{
  final List<Timer> _timers = List.empty(growable: true);

  get getTimer {
    return _timers;
  }

  addTimer(int duree,) {
    _timers.add(Timer(duree: duree, description: description, statut: statut, visible: visible, ordre: ordre, dateActivation: dateActivation));
    notifyListeners();
  }

  updateTimer(int index, String newValue) {
    _timers[index].duree = newValue;
    notifyListeners();
  }

  insertOrUpdateTimer(int index, String newValue) {
    if (index == -1) {
      addTimer(newValue);
    } else {
      updateTimer(index, newValue);
    }
  }

  deleteTimer(int index) {
    _timers.removeAt(index);
    notifyListeners();
  }

}