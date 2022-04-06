import 'package:project_timer/database/User_local.dart';
import 'package:flutter/widgets.dart';

class UserModel extends ChangeNotifier{
  final List<User> _users = List.empty(growable: true);

  get getUser {
    return _users;
  }

  addUser(String name, String prenom) {
    _users.add(User(name: name, prenom: prenom));
    notifyListeners();
  }

  updateUser(int index, String newName,String newPrenom) {
    _users[index].name = newName;
    _users[index].prenom = newPrenom;
    notifyListeners();
  }

  insertOrUpdateUser(int index, String newName, String newPrenom) {
    if (index == -1) {
      addUser(newName, newPrenom);
    } else {
      updateUser(index, newName, newPrenom);
    }
  }

  deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

}