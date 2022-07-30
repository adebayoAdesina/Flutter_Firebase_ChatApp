import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> getCurrentUser() async{
    try {
      final user = _auth.currentUser;
      
      print(user!.email);
    } catch (e) {
      print(e);
    }

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
}
