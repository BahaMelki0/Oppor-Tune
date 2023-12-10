
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontandback/reusable_widgets/reusable_widget.dart';
import 'package:frontandback/screens/home_screen.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _repeatPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/Asset1.png',
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.indigo[700],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    reusableTextField("Enter Email ", Icons.mail, false,
                        _emailTextController),
                    const SizedBox(
                      height: 8,
                    ),
                    reusableTextField("******", Icons.lock, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 8,
                    ),
                    reusableTextField("****** ", Icons.lock, true,
                        _repeatPasswordTextController ),
                    const SizedBox(
                      height: 8,
                    ),
                    firebaseUIButton(context, "Reset Password", () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _emailTextController.text)
                          .then((value) => Navigator.of(context).pop());
                    })
                  ],
                ),
              ))),
    );
  }
}
