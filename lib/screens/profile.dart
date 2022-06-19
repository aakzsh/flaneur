import 'package:flaneur/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:localstore/localstore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final db = Localstore.instance;

  int _longestStreak = -1;
  int _ongoingStreak = 1;
  bool _isStreakOngoing = false;
  int _taskCounter = -1;

  @override
  void initState() {
    db.collection('data').doc("base").get().then((value) {
      print("===================");
      print(value?['isStreakOngoing']);
      setState(() {
        _ongoingStreak = value?['ongoingStreak'];
        _longestStreak = value?['longestStreak'];
        _isStreakOngoing = value?['isStreakOngoing'];
        _taskCounter = value?['taskCounter'];
      });
      // value?.keys.forEach((element) {
      //   print(value[element]);

      //   setState(() {

      //   });
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().bgclr,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("My Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: AppColors().secondary,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/fire.png',
                    height: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Current Streak",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$_ongoingStreak days",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: AppColors().accent),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Total Tasks",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$_taskCounter",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: AppColors().accent),
                    ),
                  ],
                ),
                Container(
                  color: AppColors().secondary,
                  width: 8,
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Max Streak",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$_longestStreak days",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: AppColors().accent),
                    ),
                  ],
                ),
              ],
            )
          ],
        )));
  }
}
