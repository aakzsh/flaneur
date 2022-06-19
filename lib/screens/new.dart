import 'package:flaneur/constants/colors.dart';
import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
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
                    child: Container(color: Colors.white),
                  ),
                ),
                duration: Duration(seconds: 1),
                bottom: bottom,
              ),

              Column(
                children: <Widget>[
                  Center(
                      child: InkWell(
                    child: Image.asset(
                      "assets/camera.png",
                      width: w - 60,
                    ),
                    onTap: () {
                      // setState(() => bottom = 450);
                      showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(title: Text("lmao")));
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
