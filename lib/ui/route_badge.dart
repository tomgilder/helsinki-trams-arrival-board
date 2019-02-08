import 'package:flutter/material.dart';

class RouteBadge extends StatelessWidget {
  RouteBadge(this.routeNumber);

  final String routeNumber;

  final Map<String, Color> _colors = {
    "9": Colors.pink,
    "3": Colors.blue
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 110),
        decoration: ShapeDecoration(
            color: _colors[routeNumber] ?? Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        child: Center(
            child: Text(routeNumber,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                    fontFamily: 'monospace',
                    color: Colors.white)
            )
      )
    );
  }
}