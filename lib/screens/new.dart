import 'package:flaneur/constants/colors.dart';
import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  double height = 100;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors().bgclr,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 3),
                height: height,
                child: Container(height: 0, width: 200, color: Colors.blue),
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
                      setState(() => height = 200);
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
