import 'package:flaneur/constants/colors.dart';
import 'package:flaneur/screens/dashboard.dart';
import 'package:flaneur/screens/profile.dart';
import 'package:flaneur/screens/quote.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      ? const Icon(
                          Icons.work_rounded,
                          color: Colors.white,
                          size: 35,
                        )
                      : const Icon(
                          Icons.work_outline_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const Icon(
                          Icons.widgets_rounded,
                          color: Colors.white,
                          size: 35,
                        )
                      : const Icon(
                          Icons.widgets_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 35,
                        )
                      : const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 35,
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
