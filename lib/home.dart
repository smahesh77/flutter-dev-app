import 'package:carbon_footprint_calc/calc.dart';
import 'package:flutter/material.dart';
import 'sign.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loading.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String email = '';
  String password = "";
  bool loading = false;

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/5333978.jpg"),
                        fit: BoxFit.cover)),
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
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.green),
                            //border: InputBorder.none,
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
                          style: TextStyle(color: Colors.black),
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
                      SizedBox(height: 30),
                      Container(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (_auth.currentUser != null) {
                              setState(() {
                                loading = false;
                              });
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CarbonFootprintPage()),
                            );
                          },
                          child: Text("LOGIN"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFF0F9D58),
                            backgroundColor: Colors.white,
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
                                    builder: (context) => const SignUp()),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Color(0xFF0F9D58),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
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
