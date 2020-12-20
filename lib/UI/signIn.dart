import 'package:eLearn/UI/api-user.dart';
import 'package:eLearn/UI/signUp.dart';
import 'package:eLearn/main.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailCtrl = TextEditingController();

  final TextEditingController _passwordCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isSubmitting = false, _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Signin'),
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
                    'SignIn',
                    style: Theme.of(context).textTheme.headline3,
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
                        icon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.length < 6 ? 'Password too short' : null,
                      controller: _passwordCtrl,
                      obscureText: _obsecureText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your password',
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
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        _isSubmitting
                            ? CircularProgressIndicator()
                            : RaisedButton(
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
                                          fontSize: 20.0,
                                          color: Colors.black87),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isSubmitting = true;
                                    });
                                    final res = await signin({
                                      'email': _emailCtrl.text,
                                      'password': _passwordCtrl.text
                                    });
                                    setState(() {
                                      _isSubmitting = false;
                                    });
                                    if (res['error'] != null) {
                                      _snackbar(
                                          msg: res['error'], color: Colors.red);
                                    } else {
                                      _formKey.currentState.reset();
                                      _snackbar(msg: 'Login Successful');
                                      _directTo();
                                    }
                                  } else
                                    print('input invalid');
                                }),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text('Not a member, signup here'),
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

  void _snackbar({String msg, Color color = Colors.blue}) {
    var _snack = SnackBar(
        content: Text(
      msg,
      style: TextStyle(color: color),
    ));
    _scaffoldKey.currentState.showSnackBar(_snack);
  }

  void _directTo() {
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }
}
