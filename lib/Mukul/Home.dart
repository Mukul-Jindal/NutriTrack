// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/Mukul/CaloriesInfo.dart';
import 'package:nutrition_app/Mukul/Components/FoodType.dart';
import 'package:nutrition_app/Mukul/WaterTracker.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.body}) : super(key: key);
  final body;

  @override
  State<Home> createState() => _HomeState(body: body);
}

class _HomeState extends State<Home> {
  _HomeState({required this.body}) : super();

  final body;
  var date;
  var totalProtein = 0;
  var totalCalories = 0;
  var totalFat = 0;
  var totalCarbs = 0;
  double totalWater = 0;

  @override
  void initState() {
    // TODO: implement initState
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    date = formatter.format(now);
    bool check = body.data().toString().contains('Food Track');
    // body['Food Track'].length;
    if (check) {
      for (int i = 0; i < body['Food Track'].length; i++) {
        if (body['Food Track'][i]["Date"] == date) {
          setState(() {
            totalProtein =
                totalProtein + int.parse(body['Food Track'][i]["Protein"]);
            totalCalories =
                totalCalories + int.parse(body['Food Track'][i]["Calories"]);
            totalFat = totalFat + int.parse(body['Food Track'][i]["Fat"]);
            totalCarbs =
                totalCarbs + int.parse(body['Food Track'][i]["Carbohydrates"]);
          });
        }
      }
    }
    if (body.data().toString().contains('Water Track')) {
      for (int i = 0; i < body['Water Track'].length; i++) {
        if (body['Water Track'][i]["Date"] == date) {
          setState(() {
            totalWater =
                totalWater + (double.parse(body['Water Track'][i]["Intake Amount"])/1000.000);
          });
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        // "Hello ${snapshot.data!.docs[val]['Name']}",
                        "Hello ${body['Name']}",
                        style: TextStyle(
                          color: Color(0xFF91C788),
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "Find, Track and eat healthy food",
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF2F0),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width) * 0.9 * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "ARTICLE",
                                style: TextStyle(
                                  color: Color(0xFFFF806E),
                                  letterSpacing: 1.5,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "The pros and cons of fast food.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: (MediaQuery.of(context).size.width) *
                                      0.9 *
                                      0.5 *
                                      0.7,
                                  height: (MediaQuery.of(context).size.height) *
                                      0.05,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF8473),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Read Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/FastFood.png'),
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CaloriesInfo(
                                body: body,
                                date: date,
                                totalCalories: totalCalories,
                                totalCarbs: totalCarbs,
                                totalFat: totalFat,
                                totalProtein: totalProtein,
                              ),
                            ),
                          );
                        },
                        enableFeedback: false,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF9E9BC7),
                            borderRadius: BorderRadius.circular(27),
                          ),
                          height: (MediaQuery.of(context).size.height) * 0.1,
                          width:
                              (MediaQuery.of(context).size.width) * 0.9 * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.yellow,
                                size: MediaQuery.of(context).size.height *
                                    0.1 *
                                    0.5,
                              ),
                              Text(
                                '${totalCalories} Kcal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.1 *
                                      0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => waterTracker(
                                body: body,
                                date: date,
                                totalWater: totalWater,
                              ),
                            ),
                          );
                        },
                        enableFeedback: false,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF9E9BC7),
                            borderRadius: BorderRadius.circular(27),
                          ),
                          height: (MediaQuery.of(context).size.height) * 0.1,
                          width:
                              (MediaQuery.of(context).size.width) * 0.9 * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.water_drop_sharp,
                                color: Colors.blue,
                                size: MediaQuery.of(context).size.height *
                                    0.1 *
                                    0.5,
                              ),
                              Text(
                                '${totalWater} L',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.1 *
                                      0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.14,
                  decoration: BoxDecoration(
                    color: Color(0xFF9E9BC7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: (MediaQuery.of(context).size.height) * 0.10,
                          width:
                              (MediaQuery.of(context).size.width) * 0.9 * 0.5,
                          child: Center(
                            child: Text(
                              "Track Your Weekly Progress",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width) * 0.9 * 0.3,
                            height: (MediaQuery.of(context).size.height) * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View Now",
                                  style: TextStyle(
                                    color: Color(0xFF9E9BC7),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Color(0xFF9E9BC7),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.3,
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose your Favorites",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height:
                            (MediaQuery.of(context).size.height) * 0.3 * 0.6,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FoodType(
                              bgcolor: 0xFFFFF2F0,
                              boxName: "Fruits",
                              imagePath: "assets/Fruits.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FoodType(
                              bgcolor: 0xFFEFF7EE,
                              boxName: "Vegetable",
                              imagePath: "assets/Vegetables.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FoodType(
                              bgcolor: 0xFFFFF8EB,
                              boxName: "Snacks",
                              imagePath: "assets/Snacks.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
