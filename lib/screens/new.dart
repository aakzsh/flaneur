import 'package:flaneur/constants/colors.dart';
import 'package:flaneur/screens/dashboard.dart';
import 'package:flaneur/screens/home.dart';
// import 'package:flaneur/screens/home2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> with SingleTickerProviderStateMixin {
  hehe() {
    Future.delayed(
      Duration(milliseconds: 1650),
      () => {
        setState(() {
          op = 0;
        })
      },
    );
  }

  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String texty = "";

  lol() {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Home(),
              duration: Duration(seconds: 2)),
          (route) => false);
    });
  }

  double bottom = 300;
  double op = 0.0;
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

              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Center(
                      child: InkWell(
                    highlightColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/cam.png",
                            width: 320,
                          ),
                          Opacity(
                            opacity: op,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(right: 40, bottom: 210),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    'assets/ffflash.png',
                                    height: 60,
                                  ),
                                )),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 54, right: 78),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                      onTap: () {
                                        _controller
                                            .forward(from: 0.0)
                                            .then((value) => {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          Container(
                                                              height: 400,
                                                              child:
                                                                  AlertDialog(
                                                                      scrollable:
                                                                          true,
                                                                      backgroundColor:
                                                                          AppColors()
                                                                              .secondary,
                                                                      content:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              300,
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: <Widget>[
                                                                              InkWell(
                                                                                highlightColor: Colors.transparent,
                                                                                splashFactory: NoSplash.splashFactory,
                                                                                splashColor: Colors.transparent,
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
                                                                                decoration: InputDecoration(hintText: "Enter your daily task..."),
                                                                              ),
                                                                              MaterialButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    bottom = 450;
                                                                                  });
                                                                                  setState(() {
                                                                                    op = 1;
                                                                                  });
                                                                                  hehe();
                                                                                  lol();
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                color: AppColors().accent,
                                                                                child: Text("Submit"),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ))))
                                                });

                                        // setState(() => bottom = 450);
                                      },
                                      child: RotationTransition(
                                        turns: Tween(begin: 0.0, end: 0.5)
                                            .animate(_controller),
                                        child: Image.asset(
                                          'assets/lens.png',
                                          height: 160,
                                        ),
                                      ))))
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Press the lens to enter your new task",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
