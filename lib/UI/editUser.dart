import 'package:flutter/material.dart';
import '../models/user.dart';

class EditUser extends StatefulWidget {
  final User user;
  EditUser({Key key, this.user}) : super(key: key);
  @override
  EditUserState createState() => EditUserState();
}

class EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EditUser'),
        ),
        body: Center(
          child: Text(widget.user.name),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('B'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
