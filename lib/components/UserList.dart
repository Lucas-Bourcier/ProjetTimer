import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_timer/models/User.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<UserQuerySnapshot>(
        ref: usersRef,
        builder: (context, AsyncSnapshot<UserQuerySnapshot> snapshot, Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong!');
          if (!snapshot.hasData) return Text('Loading users...');

          // Access the QuerySnapshot
          UserQuerySnapshot querySnapshot = snapshot.requireData;

          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              User user = querySnapshot.docs[index].data;

              return Text('User name: ${user.mail}, age ${user.pass}');
            },
          );
        }
    );
  }}