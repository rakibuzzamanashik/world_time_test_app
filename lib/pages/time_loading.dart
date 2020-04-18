import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TimeLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitRipple(
            color: Colors.white,
            size: 85.0,
          ),
          SizedBox(height: 50.0),
          Text(
            "Loading time",
            style: TextStyle(
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}