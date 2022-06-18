import 'package:flaneur/constants/colors.dart';
import 'package:flaneur/screens/dashboard.dart';
import 'package:flaneur/screens/new.dart';
import 'package:flaneur/screens/profile.dart';
import 'package:flaneur/screens/quote.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color accent = Color.fromRGBO(255, 100, 85, 1);
  int pageIndex = 1;

  final pages = [
    const Quote(),
    const Dashboard(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[pageIndex],
        backgroundColor: AppColors().bgclr,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors().secondary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    icon: pageIndex == 0
                        ? ImageIcon(
                            AssetImage('assets/menu.png'),
                            size: 20,
                            color: accent,
                          )
                        : ImageIcon(
                            AssetImage('assets/menu.png'),
                            size: 20,
                            color: Colors.white,
                          )),
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    icon: pageIndex == 1
                        ? ImageIcon(
                            AssetImage('assets/home.png'),
                            size: 20,
                            color: accent,
                          )
                        : ImageIcon(
                            AssetImage('assets/home.png'),
                            size: 20,
                            color: Colors.white,
                          )),
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    icon: pageIndex == 2
                        ? ImageIcon(
                            AssetImage('assets/user.png'),
                            size: 20,
                            color: accent,
                          )
                        : ImageIcon(
                            AssetImage('assets/user.png'),
                            size: 20,
                            color: Colors.white,
                          )),
              ],
            ),
          ),
        ));
  }
}
