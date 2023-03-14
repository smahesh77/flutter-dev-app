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
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            TextButton(
              child: Text('Home'),
              onPressed: () {
                // TODO: Add navigation to the home screen
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextButton(
              child: Text('Travel'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarbonFootprintPage()),
                );
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextButton(
              child: Text('Secondary'),
              onPressed: () {
                // TODO: Add navigation to the secondary screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
