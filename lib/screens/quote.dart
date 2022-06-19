import 'dart:convert';

import 'package:flaneur/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  State<Quote> createState() => _QuoteState();
}

String showQ = "...";

class _QuoteState extends State<Quote> {
  @override
  void initState() {
    getQ();
  }

  getQ() {
    String url = "https://api.quotable.io/random?tags=love";
    final response = http.get(Uri.parse(url)).then((value) => {
          setState(() {
            print(value.body);
            showQ = jsonDecode(value.body)['content'];
          })
        });

    // var responseData = response.;
    // return responseData;
    // setState(() {
    //   showQ = response;
    // });
  }

  //  http.get(Uri.parse('https://api.quotable.io/random?tags=aesthetic'));

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().bgclr,
      body: Center(
          child: Container(
        height: 270,
        width: 0.75 * w,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                height: 150,
                width: 0.60 * w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/aes.png'),
                        fit: BoxFit.cover)),
                child: Center(),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 30),
                    child: Container(
                      width: 0.6 * w,
                      child: Text(
                        showQ,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: Colors.black),
                      ),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
