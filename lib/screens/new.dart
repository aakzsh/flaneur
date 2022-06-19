import 'package:flaneur/constants/colors.dart';
import 'package:flaneur/screens/dashboard.dart';
import 'package:flaneur/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  String texty = "";
  lol() {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(type: PageTransitionType.fade, child: Home()),
          (route) => false);
    });
  }

  double bottom = 300;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().bgclr,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // SlideTransition(
              //   position: _animation,
              //   child: Container(height: 0, width: 200, color: Colors.blue),
              // ),
              Container(
                height: h - 100,
                // color: Colors.yellow,
              ),
              AnimatedPositioned(
                child: Container(
                  height: 200,
                  width: 150,
                  color: AppColors().polclr[2],
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 40),
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          "$texty",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                duration: Duration(seconds: 3),
                bottom: bottom,
              ),

              Column(
                children: <Widget>[
                  Center(
                      child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    child: Image.asset(
                      "assets/camera.png",
                      width: w - 60,
                    ),
                    onTap: () {
                      // setState(() => bottom = 450);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                backgroundColor: AppColors().secondary,
                                content: Container(
                                  height: 300,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      InkWell(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            'assets/close.png',
                                            height: 40,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextFormField(
                                        onChanged: (text) {
                                          texty = text;
                                        },
                                        // maxLines: 5,
                                        decoration: InputDecoration(
                                            hintText:
                                                "Enter your daily task..."),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            bottom = 450;
                                          });
                                          lol();
                                          Navigator.pop(context);
                                        },
                                        color: AppColors().accent,
                                        child: Text("Submit"),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                    },
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Press the lens to enter your new task",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
