import 'package:flaneur/constants/colors.dart';
import 'package:flaneur/screens/new.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
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
              )
            ],
          ),
        )),
      ),
    );
  }
}
