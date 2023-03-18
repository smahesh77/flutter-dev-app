import 'package:flutter/material.dart';
import 'pie.dart';

class CarbonFootprintPage3 extends StatefulWidget {
  CarbonFootprintPage3({Key? key, required this.travel, required this.person})
      : super(key: key);
  double travel;
  double person;
  @override
  _CarbonFootprintPage3State createState() => _CarbonFootprintPage3State();
}

class _CarbonFootprintPage3State extends State<CarbonFootprintPage3> {
  // Initialize variables to store user input data

  double electricity = 0;
  double lpg = 0;
  double waste = 0;
  int numPeople = 0;

  // Method to calculate carbon footprint
  double calculateCarbonFootprint() {
    // assuming average emission factor of 0.117 kg CO2e per km
    double electricityFootprint = electricity *
        0.527; // assuming average emission factor of 0.527 kg CO2e per kWh
    double lpgFootprint = lpg *
        2.983; // assuming average emission factor of 2.983 kg CO2e per kg of LPG
    double wasteFootprint = waste *
        0.012 *
        52.0; // assuming average emission factor of 0.012 kg CO2e per kg of waste, and multiplying by 52 to convert weekly figure to annual figure per person

    // Calculate total carbon footprint for the household per year
    double totalFootprint =
        (electricityFootprint + lpgFootprint + wasteFootprint);
    double total = totalFootprint / 1000.0;
    return total;
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
            SizedBox(height: 10),
            Text(
              "Household",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 50,
                  fontFamily: "Poppins"),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("images/123.png"))),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25.00, right: 25.00),
              child: Container(
                height: 500,
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
                                      Icons.house,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'House',
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
                                  hintText: ' Number of people in your house'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  numPeople = int.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 20.0),
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
                                      Icons.flash_on_sharp,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Energy',
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
                                  hintText:
                                      'Monthly electricity usage in kilowatt-hours'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  electricity = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Monthly lpg usage in kg'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  lpg = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 20.0),
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
                                        Icons.restore_from_trash_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Waste',
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
                                  hintText:
                                      'Weekly waste production in kilograms'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  waste = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 25.0),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 60.0),
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          Size(60, 40)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  onPressed: () {
                                    // Calculate and display the carbon footprint
                                    double house = calculateCarbonFootprint();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Pie(
                                                  travel: widget.travel,
                                                  per: widget.person,
                                                  house: house,
                                                )));
                                  },
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
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
