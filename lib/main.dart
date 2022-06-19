import 'package:flaneur/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _db = Localstore.instance;

  @override
  void initState() {
    _db.collection('data').get().then((value) {
      if (value == null) {
        // initiaslise
        print("hehe null");

        // save the item
        _db.collection('data').doc("base").set({
          "taskCounter": 0,
          "isStreakOngoing": false,
          "ongoingStreak": 0,
          "longestStreak": 0
        });
      } else {
        // do nothing

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Flaneur: feel accomplished",
      home: Home(),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
