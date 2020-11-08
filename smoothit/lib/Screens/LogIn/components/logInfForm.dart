import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smoothit/Screens/constant.dart';
import 'package:smoothit/services/auth.dart';

class LogInForm extends StatefulWidget {
  final Size size;

  const LogInForm({
    @required this.size,
  }) : super();

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          const SizedBox(height: 200),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 70),
            const Text(
              'Email',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
                width: widget.size.width * 0.6,
                child: TextFormField(
                  decoration: InputDecoration(
                    counterText: ' ',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Email field seems to be empty' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                  autocorrect: false,
                )),
            const SizedBox(height: 10),
            const Text(
              'Mot de passe',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
                width: widget.size.width * 0.6,
                child: TextFormField(
                  decoration: InputDecoration(
                    counterText: ' ',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                  obscureText: true,
                )),
          ]),
          Container(
              height: 40,
              width: widget.size.width * 0.4,
              child: Text(error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 16))),
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 250,
              height: 40,
              child: RaisedButton(
                child: const Text('Se connecter',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: kStrokeButtonColor)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = _auth.signIn(context, email, password);
                    if (result == null) {
                      setState(() =>
                          error = "Les champs remplies semblent invalides");
                    }
                  }
                },
              ),
            ),
          ),
        ]));
  }
}
