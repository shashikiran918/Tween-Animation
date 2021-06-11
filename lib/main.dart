import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double customOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TweenAnimationBuilder(
                  onEnd: (){
                    setState(() {
                      customOpacity=1;
                    });
                  },
                  curve: Curves.bounceOut,
                  duration: Duration(seconds: 2),
                  tween: Tween<double>(begin: 30, end: 100),
                  builder: (BuildContext context, dynamic value, Widget? child) {
                   return Icon(
                     Icons.flash_on,
                     color: Colors.red,
                     size: value,
                   );
                  },
                ),
                AnimatedOpacity(
                    opacity: customOpacity,
                    duration: Duration(seconds: 1),
                    child: Text(
                      "Energy",
                        style: TextStyle(
                           fontSize: 25,
                           fontWeight: FontWeight.bold,
                        ),
                    )
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
