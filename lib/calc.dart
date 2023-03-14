import 'package:flutter/material.dart';

class CarbonFootprintPage extends StatefulWidget {
  @override
  _CarbonFootprintPageState createState() => _CarbonFootprintPageState();
}

class _CarbonFootprintPageState extends State<CarbonFootprintPage> {
  // Initialize variables to store user input data
  double carDistance = 0.0;
  double carMileage = 0.0;
  double flightDistance = 0.0;
  double flightClassFactor = 0.0;
  double bikeDistance = 0.0;
  double bikemileage = 0.0;
  double busDistance = 0.0;
  final double busmileage = 10.8199;
  String? traintype;
  double trainDistanceE = 0.0;
  double trainDistanceL = 0.0;

  // Method to calculate carbon footprint
  double calculateCarbonFootprint() {
    // Calculate emissions from car travel
    double carEmissions = (carDistance / carMileage) * 0.008887; // CO2 per mile

    // Calculate emissions from air travel
    double flightEmissions =
        (flightDistance * flightClassFactor) * 0.00000609; // CO2 per mile
    double bikeEmissions = (bikeDistance / bikemileage) * 0.0023;
    double busEmissions = (busDistance / busmileage) * 0.00314;
    double trainEmissionsExpress = (trainDistanceE * 0.04 * 2.68 * 0.00049);
    double trainEmissionsLocal = (trainDistanceL * 0.1 * 2.68 * 0.00049);
    // Return total carbon footprint
    double carbonemissions = carEmissions +
        flightEmissions +
        bikeEmissions +
        busEmissions +
        trainEmissionsExpress +
        trainEmissionsLocal;
    return carbonemissions;
  }

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Car travel:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Distance traveled (miles):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      carDistance = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 8.0),
                Text('Car mileage (miles per gallon):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      carMileage = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Air travel:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Distance traveled (miles):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      flightDistance = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 8.0),
                Text('Class of service (factor):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      flightClassFactor = double.parse(value);
                    });
                  },
                ),
                Text(
                  'Bike travel:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Distance traveled (miles):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      bikeDistance = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 8.0),
                Text('bike mileage (miles per gallon):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      bikemileage = double.parse(value);
                    });
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Bus travel:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Distance traveled (miles):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      busDistance = double.parse(value);
                    });
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Train travel(Express (Fuel- Diesel)):',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Distance traveled (miles):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      trainDistanceE = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 8.0),
                Text(
                  'Train travel(Local (Fuel-Diesel)):',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Distance traveled (miles):'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      trainDistanceL = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Calculate and display the carbon footprint
                    double carbonFootprint = calculateCarbonFootprint();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Your carbon footprint'),
                          content: Text(
                              'Your estimated carbon footprint is $carbonFootprint metric tons of CO2 equivalent.'),
                          actions: [
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Calculate'),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
