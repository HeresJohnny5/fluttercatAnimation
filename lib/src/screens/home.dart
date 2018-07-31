import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _HomeState();
    }
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation; // declare instance variable
  AnimationController catController; // declare instance variable

  @override
    void initState() {
      super.initState();

      catController = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
      );
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: buildAnimation(),
      );
    }

    Widget buildAnimation() {
      return Cat();
    }
}