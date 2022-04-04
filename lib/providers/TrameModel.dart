import 'package:project_timer/database/Trame.dart';
import 'package:flutter/widgets.dart';

class TrameModel extends ChangeNotifier{
 final List<Trame> _trames = List.empty(growable: true);

  get getTrame {
    return _trames;
  }

  addTrame(String name) {
    _trames.add(Trame(name: name));
    notifyListeners();
  }

  updateTrame(int index, String newValue) {
    _trames[index].name = newValue;
    notifyListeners();
  }

  insertOrUpdateTrame(int index, String newValue) {
    if (index == -1) {
      addTrame(newValue);
    } else {
      updateTrame(index, newValue);
    }
  }

 deleteTrame(int index) {
   _trames.removeAt(index);
   notifyListeners();
 }

}