import 'package:eLearn/UI/api-user.dart';
import 'package:eLearn/UI/signIn.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _usernameCtrl = TextEditingController();

  final TextEditingController _emailCtrl = TextEditingController();

  final TextEditingController _passwordCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SignUp',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.length < 6 ? 'Username too short' : null,
                      controller: _usernameCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          hintText: 'Enter username, min length 6',
                          icon: Icon(Icons.face)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (val) =>
                          !val.contains('@') ? 'Invalid email' : null,
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter a valid email',
                          icon: Icon(Icons.email)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.length < 6 ? 'Password too short' : null,
                      controller: _passwordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            child: Icon(_obsecureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                _obsecureText = !_obsecureText;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          icon: Icon(Icons.lock)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        RaisedButton(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              'Submit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: 20.0, color: Colors.black87),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                final res = await signup({
                                  'name': _usernameCtrl.text,
                                  'email': _emailCtrl.text,
                                  'password': _passwordCtrl.text
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Text('haha');
                                    });
                              } else
                                print('input invalid');
                            }),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signin()));
                          },
                          child: Text('Already a member, signin here'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
