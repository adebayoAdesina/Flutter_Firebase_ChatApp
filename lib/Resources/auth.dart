import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/Screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getCurrentUser() async {
    String currentuser = '';
    try {
      final user = _auth.currentUser;

      currentuser = user!.email.toString();
    } catch (e) {
      print(e);
    }
    return currentuser;
  }

  signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pop(context, LoginScreen.id);
  }

  Future<String> signUpUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    String res = "An error occur";
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        res = 'The email is badly formatted.';
      } else if (error.code == 'weak-password') {
        res = 'Password should be at least 6 characters';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = 'an error occur';
    try {
      if (email.isNotEmpty || password.isEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = e.code;
      } else if (e.code == 'wrong-password') {}
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
