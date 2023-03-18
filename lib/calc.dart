import 'package:flutter/material.dart';
import 'car2.dart';

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
      Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              "Travel",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 50,
                  fontFamily: "Poppins"),
            ),
            Container(
              height: 330,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("images/car.png"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: Container(
                height: 420,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green[500]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_taxi,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Car travel',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Distance traveled (miles)'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  carDistance = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Car mileage (miles per gallon)'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  carMileage = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green[500]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.airplanemode_active,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Air travel',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Distance traveled (miles)'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  flightDistance = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Class of service (factor)'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  flightClassFactor = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            Container(
                                width: MediaQuery.of(context).size.width / 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.motorcycle_sharp,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Bike travel',
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Distance traveled (miles)'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  bikeDistance = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'bike mileage (miles per gallon)'),
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
                            Container(
                                width: MediaQuery.of(context).size.width / 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.directions_bus,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Bus travel',
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Distance traveled (miles)'),
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
                            Container(
                              width: MediaQuery.of(context).size.width / 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green[500]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.train,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Train travel',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Express(Fuel-Diesel)'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  trainDistanceE = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Local(Fuel-Diesel)'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  trainDistanceL = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                onPressed: () {
                                  // Calculate and display the carbon footprint
                                  double trav = calculateCarbonFootprint();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CarbonFootprintPage2(
                                                  travel: trav)));
                                },
                                child: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
