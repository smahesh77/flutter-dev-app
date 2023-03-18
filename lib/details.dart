import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign.dart';

class Details extends StatefulWidget {
  UserCredential userCredential;

  Details({required this.userCredential});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late int age;
  late String Gender, name;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
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
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      icon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "age",
                      hintStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      icon: Icon(
                        Icons.calendar_month,
                        color: Colors.green,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        age = int.parse(val);
                      });
                    },
                  ),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFF0F9D58),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        _firestore.collection('users').add({
                          'uid': widget.userCredential.user?.uid,
                          'username': widget.userCredential.user?.email,
                          'name': name,
                          'age': age,
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      },
                      child: Text("Submit"))
                ]),
          )),
    ]));
  }
}
