import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_shopping/AuthenticationService.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //textViewers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            //email form
            TextFormField(
              controller: _emailController,
              style: TextStyle(fontSize: 22, color:Colors.black),
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(fontSize: 22, color:Colors.black),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //password form
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(fontSize: 22, color:Colors.black),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 22, color:Colors.black)
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                //register button
                Expanded(
                    child: ElevatedButton(
                      onPressed: () async{
                        context.read<AuthenticationService>().signUp(
                          email: _emailController.text,
                          password: _passwordController.text
                        );
                      }, child: Text("Register"),
                    )
                ),
                //login button
                Expanded(
                    child: ElevatedButton(
                      onPressed: () async{
                        context.read<AuthenticationService>().signIn(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim()
                        );
                        }, child: Text("Login"),

                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
