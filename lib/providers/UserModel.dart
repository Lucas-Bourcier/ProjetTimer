import 'package:project_timer/database/User.dart';
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

  updateUser(int index, String newValue) {
    _users[index].name = newValue;
    notifyListeners();
  }

  insertOrUpdateUser(int index, String newValue) {
    if (index == -1) {
      addUser(newValue);
    } else {
      updateUser(index, newValue);
    }
  }

  deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

}