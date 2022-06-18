import 'package:flaneur/constants/colors.dart';
import 'package:flutter/material.dart';

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().bgclr,
      body: Center(
          child: Container(
        width: w - 60,
        child: Center(
            child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 40,
            ),
            child: Container(
              child: Center(
                child: Text(
                  "some random quote here lmao jejehehhe ehehe whwh",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/aes.png'), fit: BoxFit.cover)),
            ),
          ),
        )),
      )),
    );
  }
}
