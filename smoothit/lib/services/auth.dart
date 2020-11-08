import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smoothit/Models/user.dart';
import 'package:status_alert/status_alert.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LocalUser _userFromFirebaseUser(User user) {
    return user != null ? LocalUser(uid: user.uid) : null;
  }

  Stream<LocalUser> get user {
    return _auth
        .authStateChanges()
        // .map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  Future signIn(dynamic context, String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(result);
      User user = result.user;
      StatusAlert.show(
        context,
        duration: Duration(seconds: 1),
        title: 'Succès !',
        subtitle: "L'inscription s'est déroulée avec succès !",
        configuration: IconConfiguration(icon: Icons.done),
      );
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUp(dynamic context, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      StatusAlert.show(
        context,
        duration: Duration(seconds: 1),
        title: 'Succès !',
        subtitle: "L'inscription s'est déroulée avec succès !",
        configuration: IconConfiguration(icon: Icons.done),
      );
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
