import 'package:flutter/material.dart';
import 'home.dart';
import 'options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = "";

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/5333978.jpg"), fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80,
                  backgroundImage: AssetImage("images/EARTH.gif"),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    style: TextStyle(color: Colors.lightGreenAccent),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.green),
                      icon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    },
                    child: Text("SIGN UP"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Color(0xFF0F9D58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFF0F9D58),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
