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
        duration: Duration(milliseconds: 200),
        vsync: this,
      );

      catAnimation = Tween(begin: -35.0, end: -80.0).animate(
        CurvedAnimation(
          parent: catController,
          curve: Curves.easeIn,
        ),
      );
    }

  // HELPER METHODS
  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: GestureDetector( // any child tapped will bubble up to the GestureDetector
          child: Center(
            child: Stack(
              children: <Widget>[
                buildCatAnimation(),
                buildBox(),
                buildLeftFlap(),
              ],
              overflow: Overflow.visible,
            ),
          ),
          onTap: onTap, // the onTap helper method will be invoked only when the GestureDector widget is invoked
        )
      );
    }

    Widget buildCatAnimation() {
      return AnimatedBuilder(
        animation: catAnimation, // catAnimation records the current value of the property being animated
        child: Cat(),
        builder: (BuildContext context, Widget child) {
          return Positioned(
            child: child,
            top: catAnimation.value,
            right: 0.0,
            left: 0.0,
          );
        },
      );
    }

    Widget buildBox() {
      return Container(
        height: 200.0,
        width: 200.0,
        color: Colors.brown,
      );
    }

    Widget buildLeftFlap() {
      return Container(
        height: 10.0,
        width: 125.0,
        color: Colors.red,
      );
    }
}