import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontandback/reusable_widgets/reusable_widget.dart';
import 'package:frontandback/screens/home_screen.dart';
import 'package:frontandback/screens/reset_password.dart';
import 'package:frontandback/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome to Oppor\'tune!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.indigo[700],
                  ),
                ),
                Image.asset(
                  'assets/Asset1.png',
                  width: 100,
                  height: 100,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.indigo[700],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("John.jone@gmail.com", Icons.mail , false,
                    _emailTextController),
                const SizedBox(
                  height: 8,
                ),
                reusableTextField("******", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 2,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),

                ElevatedButton(
                  onPressed: () {
                    // Handle sign in action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[100],
                    minimumSize: Size(600, 45),
                  ),
                  child: Text(
                    'Sign In With Google',
                    style: TextStyle(color: Colors.white,
                        fontSize: 15,),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have account?",
            style: TextStyle(color: Colors.indigo[700],
            ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            " Sign Up",
            style: TextStyle(color: Colors.purple[100], fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.indigo[700]),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
