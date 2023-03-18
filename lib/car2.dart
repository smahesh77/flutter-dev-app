import 'package:flutter/material.dart';
import 'car3.dart';

class CarbonFootprintPage2 extends StatefulWidget {
  const CarbonFootprintPage2({Key? key, required this.travel})
      : super(key: key);
  final double travel;
  @override
  _CarbonFootprintPage2State createState() => _CarbonFootprintPage2State();
}

class _CarbonFootprintPage2State extends State<CarbonFootprintPage2> {
  // Initialize variables to store user input data
  double weeklyChickenConsumption = 0;
  double weeklyFishConsumption = 0;
  double weeklyBeefConsumption = 0;
  int weeklyVegMeals = 0;
  double weeklyWaste = 0;
  double educationExpenditure = 0;
  double insuranceExpenditure = 0;

  // Method to calculate carbon footprint
  double calculateCarbonFootprint() {
    double chickenCarbon = weeklyChickenConsumption * 52 * 6.9;
    double fishCarbon = weeklyFishConsumption * 52 * 5.1;
    double beefCarbon = weeklyBeefConsumption * 52 * 27;
    double vegCarbon = weeklyVegMeals * 52 * 0.42;
    double wasteCarbon = weeklyWaste * 52 * 0.0025;
    double educationCarbon = educationExpenditure / 10000 * 0.92;
    double insuranceCarbon = insuranceExpenditure / 5000 * 1.5;

    double totalCarbon = chickenCarbon +
        fishCarbon +
        beefCarbon +
        vegCarbon +
        wasteCarbon +
        educationCarbon +
        insuranceCarbon;

    return totalCarbon;
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
              "Personal",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 45,
                  fontFamily: "Poppins"),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("images/personal.png"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
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
                                      Icons.fastfood,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Food',
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
                            SizedBox(height: 15.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText:
                                      ' Vegetarian meal consumption in meals per week '),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  weeklyVegMeals = int.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Beef consumption in kg per week'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  weeklyBeefConsumption = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText:
                                      'Chicken consumption in kg per week'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  weeklyChickenConsumption =
                                      double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Fish consumption in kg per week'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  weeklyFishConsumption = double.parse(value);
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
                                      Icons.restore_from_trash,
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
                              ),
                            ),
                            SizedBox(height: 15.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText: 'Weekly waste you generate in kg'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  weeklyWaste = double.parse(value);
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
                                        Icons.attach_money,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Miscellaneous',
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 15.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText:
                                      'Education expenditure in Rupees per month'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  educationExpenditure = double.parse(value);
                                });
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hoverColor: Colors.red,
                                  hintText:
                                      'Annual insurance expenditure in Rupees '),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  insuranceExpenditure = double.parse(value);
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Container(
                                height: 80,
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  onPressed: () {
                                    // Calculate and display the carbon footprint
                                    double per =
                                        calculateCarbonFootprint() / 1000;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CarbonFootprintPage3(
                                                    travel: widget.travel,
                                                    person: per)));
                                  },
                                  child: Icon(Icons.arrow_forward),
                                ),
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
