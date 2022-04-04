import 'package:project_timer/database/Groupe.dart';
import 'package:flutter/widgets.dart';

class GroupeModel extends ChangeNotifier{
  final List<Groupe> _groupes = List.empty(growable: true);

  get getGroupe {
    return _groupes;
  }

  addGroupe(String name) {
    _groupes.add(Groupe(name: name));
    notifyListeners();
  }

  updateGroupe(int index, String newValue) {
    _groupes[index].name = newValue;
    notifyListeners();
  }

  insertOrUpdateGroupe(int index, String newValue) {
    if (index == -1) {
      addGroupe(newValue);
    } else {
      updateGroupe(index, newValue);
    }
  }

  deleteGroupe(int index) {
    _groupes.removeAt(index);
    notifyListeners();
  }

}