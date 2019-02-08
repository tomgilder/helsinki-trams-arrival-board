import 'package:flutter/material.dart';
import 'package:flutter_trams/ui/route_badge.dart';
import '../model/service.dart';

class ServiceListRow extends StatelessWidget
{
  ServiceListRow(this.index, this.service);

  final int index;
  final Service service;

  @override
  Widget build(BuildContext context)
  {
    final rowBackgroundColor = index % 2 == 0 ? Colors.black : Color.fromRGBO(30, 30, 30, 1);

    return new Padding
    (
        padding: EdgeInsets.all(10),
        child: Container(
          color: rowBackgroundColor,
          padding: EdgeInsets.all(10.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children:
          [
            // Route number
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                child: RouteBadge(service.routeNumber)
            ),

            // Destination
            Expanded(
              child: Text(
                service.destination,
                maxLines: 1,
                style: TextStyle(color: Colors.grey, fontSize: 35),
              )
            ),

            // Time
            Text(
              service.displayTime,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: _getTimeTextStyle(service))
          ]))
    );
  }

  static TextStyle _getTimeTextStyle(Service service)
  {
    if (service.isRealtime)
    {
      return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        color: Colors.white,
        fontFamily: 'monospace');
    }

    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Colors.grey,
      fontFamily: 'monospace'
    );
  }
}