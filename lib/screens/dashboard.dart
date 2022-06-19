import 'package:flaneur/constants/colors.dart';
import 'package:flaneur/screens/new.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final colors = [
    0xffD6EAFC,
    0xffFCD6D6,
    0xffAEF8A7,
    0xffDD98FE,
    0xffFFCEA0,
    0xffFFE9AF
  ];

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors().bgclr,
      body: SafeArea(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.arrow_back_ios),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("June 2022",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20)),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => New()));
                    },
                    elevation: 2.0,
                    fillColor: AppColors().accent,
                    child: Icon(
                      Icons.add,
                      size: 25.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              polaroid(w)
            ],
          ),
        )),
      ),
    );
  }

  polaroid(w) {
    return Container(
      height: 270,
      width: 0.45 * w,
      color: Color(colors[0]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              height: 150,
              width: 0.35 * w,
              color: Colors.white,
              child: Center(
                child: Text("gotta clean",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black)),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  "18 June 2022",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                ),
              ),
              Checkbox(
                activeColor: Colors.black,
                side: BorderSide(
                  color: Colors.black, //your desire colour here
                  width: 1.5,
                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
