import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 250,
            color: Colors.blue,
          ),
          AnimatedBuilder(
              animation: _animationController,
              child: Container(
                height: 50,
                width: 250,
                color: Colors.green,
              ),
              builder: (context, child) {
                // METHOD 1
                // return Padding(
                //   padding: EdgeInsets.only(
                //       top: 100 - _animationController.value * 100),
                //   child: child,
                // );

                //   METHOD 2
                return SlideTransition(
                  child: child,
                  position:
                      Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeOut,
                    ),
                  ),
                );
              }),
        ],
      ),
    ));
  }
}
