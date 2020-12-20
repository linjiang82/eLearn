import 'package:flutter/material.dart';
import '../models/user.dart';
import '../UI/editUser.dart';

class Profile extends StatefulWidget {
  final User user;
  Profile({Key key, this.user}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditUser(user: widget.user)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          width: 300,
          height: 100,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.person, size: 40.0),
            Text(
              widget.user.name,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              widget.user.email,
              style: TextStyle(color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
