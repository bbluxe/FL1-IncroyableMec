import 'package:flutter/material.dart';
import 'package:smoothit/Screens/Common/components/screen_title.dart';
import 'package:smoothit/Screens/constant.dart';
import 'package:smoothit/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80),
                const Text("Veuillez entrez vos identifiants",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 30),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Email',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                      width: size.width * 0.6,
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
                        validator: (val) => val.isEmpty
                            ? 'Email field seems to be empty'
                            : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                        autocorrect: false,
                      )),
                  const Text(
                    'Mot de passe',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                      width: size.width * 0.6,
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
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                        obscureText: true,
                      )),
                ]),
                const SizedBox(height: 10),
                Container(
                    height: 60,
                    width: size.width * 0.4,
                    child: Text(error,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 16))),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 250,
                    height: 40,
                    child: RaisedButton(
                      child: const Text("S'inscrire",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: kStrokeButtonColor)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.signUp(context, email, password);
                          if (result == null) {
                            setState(() => error =
                                'Please supply a valid email or an email never used');
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            )));
  }
}
