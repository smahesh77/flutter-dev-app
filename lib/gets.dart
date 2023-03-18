import 'package:flutter/material.dart';
import 'main.dart';

class Gets extends StatefulWidget {
  const Gets({Key? key}) : super(key: key);

  @override
  State<Gets> createState() => _GetsState();
}

class _GetsState extends State<Gets> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/214.jpg"), fit: BoxFit.cover)),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Calco',
                      style: TextStyle(
                          fontFamily: "Schyler",
                          fontSize: 100,
                          color: Colors.green),
                    ),
                    SizedBox(height: 1),
                    Container(
                      alignment: Alignment.center,
                      height: 350,
                      width: 500,
                      child: Stack(children: [
                        Container(
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/221.jpeg"),
                                  fit: BoxFit.cover),
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // Text(
              //    'All your activities tracked in one app ',
              //   style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //      color: Colors.green),
              //),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ))
    ]);
  }
}
