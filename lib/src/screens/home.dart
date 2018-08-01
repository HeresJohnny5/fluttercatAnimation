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

      catAnimation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(
          parent: catController,
          curve: Curves.easeIn,
        ),
      );

      catController.forward();
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
      return AnimatedBuilder(
        animation: catAnimation, // catAnimation records the current value of the property being animated
        child: Cat(),
        builder: (BuildContext context, Widget child) {
          return Container(
            child: child,
            margin: EdgeInsets.only(top: catAnimation.value),
          );
        },
      );
    }
}