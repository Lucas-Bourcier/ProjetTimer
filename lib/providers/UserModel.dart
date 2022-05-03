import 'package:project_timer/database/User_local.dart';
import 'package:flutter/widgets.dart';

class UserModel extends ChangeNotifier{
  final List<User> _users = List.empty(growable: true);

  get getUser {
    return _users;
  }

  addUser(String mail, String pass) {
    _users.add(User(mail: mail, pass: pass));
    notifyListeners();
  }

  updateUser(int index, String newMail,String newPass) {
    _users[index].mail = newMail;
    _users[index].pass = newPass;
    notifyListeners();
  }

  insertOrUpdateUser(int index, String newMail, String newPass) {
    if (index == -1) {
      addUser(newMail, newPass);
    } else {
      updateUser(index, newMail, newPass);
    }
  }

  deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

}