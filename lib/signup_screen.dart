import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontandback/reusable_widgets/reusable_widget.dart';
import 'package:frontandback/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
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
                padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      'Create An Account',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.indigo[700],
                      ),
                    ),
                    reusableTextField("john jone", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 7,
                    ),
                    reusableTextField("john.john@yahoo.com", Icons.mail, false,
                        _emailTextController),
                    const SizedBox(
                      height: 7,
                    ),
                    reusableTextField("Enter Password", Icons.lock, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 7,
                    ),
                    reusableTextField("Repeat Password", Icons.lock, true,
                        _repeatPasswordTextController),
                    const SizedBox(
                      height: 7,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            // Gérer le clic sur "User" ici
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5), // Espacement entre le cadre et le texte
                              Text(
                                'User',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.indigo[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Gérer le clic sur "Company" ici
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5), // Espacement entre le cadre et le texte
                              Text(
                                'Company',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.indigo[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }),
          ],
          ),
      ))),
    );
  }
}
