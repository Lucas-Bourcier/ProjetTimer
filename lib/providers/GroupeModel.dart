import 'package:project_timer/database/Groupe.dart';
import 'package:flutter/widgets.dart';

class GroupeModel extends ChangeNotifier{
  final List<Groupe> _groupes = List.empty(growable: true);

  get getGroupe {
    return _groupes;
  }

  addGroupe(String libelle) {
    _groupes.add(Groupe(libelle: libelle));
    notifyListeners();
  }

  updateGroupe(int index, String newLibelle) {
    _groupes[index].libelle = newLibelle;
    notifyListeners();
  }

  insertOrUpdateGroupe(int index, String newLibelle) {
    if (index == -1) {
      addGroupe(newLibelle);
    } else {
      updateGroupe(index, newLibelle);
    }
  }

  deleteGroupe(int index) {
    _groupes.removeAt(index);
    notifyListeners();
  }

}