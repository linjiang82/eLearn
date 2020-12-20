import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/user.dart';
import './UI/profile.dart';
import './UI/signIn.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'E-Learning'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: FlatButton(
            child: Text('Signin'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signin()));
            },
          ),
        ),
        body: FutureBuilder<List<User>>(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              print(snapshot.error);
            else if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Profile(user: snapshot.data[index]);
                  },
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
