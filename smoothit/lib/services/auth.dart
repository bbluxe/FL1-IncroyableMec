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
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<dynamic> signIn(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User user = result.user;
      StatusAlert.show(
        context,
        duration: const Duration(seconds: 1),
        title: 'Succès !',
        subtitle: "L'inscription s'est déroulée avec succès !",
        configuration: const IconConfiguration(icon: Icons.done),
      );
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> signUp(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User user = result.user;
      StatusAlert.show(
        context,
        duration: const Duration(seconds: 1),
        title: 'Succès !',
        subtitle: "L'inscription s'est déroulée avec succès !",
        configuration: const IconConfiguration(icon: Icons.done),
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

  Future<dynamic> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
