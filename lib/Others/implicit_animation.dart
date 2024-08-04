import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool _myBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // be default, it has fade transition
            Container(
              height: 150,
              width: 150,
              color: Colors.blue,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _myBool
                    ? Text(
                        'Hello World',
                        style: TextStyle(fontSize: 30),
                      )
                    : Icon(
                        Icons.add,
                        size: 30,
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // in case of building same widget on animation, make sure to give different key to them
            Container(
              height: 150,
              width: 150,
              color: Colors.blue,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                // in case of building same widget on animation, make sure to give different key to them

                child: Text(
                  key: ValueKey(_myBool ? 0 : 1),
                  _myBool ? 'Hello World' : 'Hello Everyone',
                  style: TextStyle(fontSize: 30),
                ),
                //   with transitionBuilder, we can change the transition
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        onPressed: () {
          setState(() {
            _myBool = !_myBool;
          });
        },
      ),
    );
  }
}
