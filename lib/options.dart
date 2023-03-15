import 'package:flutter/material.dart';
import 'calc.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/5333978.jpg"), fit: BoxFit.cover)),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          children: <Widget>[
            // First card
            Card(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage("images/4873.jpg"),
                    // colorFilter:ColorFilter.,
                    child: InkWell(
                      onTap: () {},
                    ),
                    fit: BoxFit.cover,
                  ),
                  // Text('Travel')
                ],
              ),
            ),
            // Second card
            Card(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Ink.image(
                    image: AssetImage("images/6157.jpg"),
                    child: InkWell(
                      onTap: () {},
                    ),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent),
                  )
                ],
              ),
            ),
            // Third card
            Card(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Ink.image(
                    image: AssetImage("images/19198323.jpg"),
                    child: InkWell(
                      onTap: () {},
                    ),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Primary Needs',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
            ), // Fourth card
            Card(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Ink.image(
                    image: AssetImage("images/5573.jpg"),
                    child: InkWell(
                      onTap: () {},
                    ),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Secondary Needs',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent),
                  )
                ],
              ),
            ),

            Card(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Ink.image(
                    image: AssetImage("images/1134.jpg"),
                    child: InkWell(
                      onTap: () {},
                    ),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Graphical Analysis',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  )
                ],
              ),
            ),
            Card(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Ink.image(
                    image: AssetImage("images/2323.jpg"),
                    child: InkWell(
                      onTap: () {},
                    ),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Card(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Ink.image(
                    image: AssetImage("images/3081627.jpg"),
                    child: InkWell(
                      onTap: () {},
                    ),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Suggestion Box',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
