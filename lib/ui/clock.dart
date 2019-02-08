import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockState();
  }
}

class _ClockState extends State<Clock> {
  String _timeString;
  final DateFormat _format = DateFormat("HH:mm");

  @override
  void initState() {
    _timeString = _format.format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_timeString,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 100,
            color: Colors.white,
            fontFamily: 'monospace')
    );
  }

  void _getTime() {
    setState(() => _timeString = _format.format(DateTime.now()));
  }
}
