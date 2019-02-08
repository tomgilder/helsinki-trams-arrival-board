import 'package:flutter_trams/model/clock.dart';
import 'package:intl/intl.dart';

class Service {
  Service(this.scheduledArrival, this.realtimeArrival, this.isRealtime, this.routeNumber, this.destination);

  final DateTime scheduledArrival;
  final DateTime realtimeArrival;
  final bool isRealtime;
  final String routeNumber;
  final String destination;
  
  final DateFormat _dateFormatter = new DateFormat('HH:mm');

  String get displayTime {
    final now = Clock.now();

    if (isRealtime) {
      final difference = realtimeArrival.difference(now);

      if (difference.inMinutes < 1) {
        return "due";
      }

      if (difference.inMinutes == 1) {
        return "1 min";
      }

      return difference.inMinutes.toString() + " mins";
    }

    return _dateFormatter.format(realtimeArrival);
  }
}