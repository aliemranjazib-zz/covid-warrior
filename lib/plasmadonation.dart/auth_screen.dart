import 'package:covidpk/plasmadonation.dart/auth_form.dart';
import 'package:covidpk/plasmadonation.dart/blood_form.dart';
import 'package:covidpk/plasmadonation.dart/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // .whenComplete(() => Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (_) => BloodForm())));
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('email', email);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => BloodForm()));
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user.uid)
            .set({
          'username': username,
          'email': email,
        });
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => BloodForm()));
      }
    } on FirebaseAuthException catch (err) {
      // var message = 'An error occurred, pelase check your credentials!';
      if (err.code == 'weak-password') {
        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text('The password provided is too weak.'),
            backgroundColor: Theme.of(ctx).errorColor,
          ),
        );
      } else if (err.code == 'email-already-in-use') {
        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text('The account already exists for that email.'),
            backgroundColor: Theme.of(ctx).errorColor,
          ),
        );
      } else if (err.code == 'user-not-found') {
        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
            backgroundColor: Theme.of(ctx).errorColor,
          ),
        );
        print('No user found for that email.');
      } else if (err.code == 'wrong-password') {
        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
            backgroundColor: Theme.of(ctx).errorColor,
          ),
        );
      }
      // if (err.message != null) {
      //   message = err.message;
      // }

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}
