import 'package:flutter_trams/model/service.dart';

class ServiceListParser
{
  static List<Service> Parse(dynamic data)
  {
    List<Service> services =
        (data['stops'] as List)
        .expand((f) => f['stoptimesWithoutPatterns'])
        .map((f) => _parseService(f))
        .toList();

    services.sort((a, b) => a.realtimeArrival.compareTo(b.realtimeArrival));

    return services;
  }

  static Service _parseService(dynamic map)
  {
    final now = DateTime.now();
    final lastMidnight = new DateTime(now.year, now.month, now.day);

    final scheduledArrival = lastMidnight.add(Duration(seconds: map['scheduledArrival']));
    final realtimeArrival = lastMidnight.add(Duration(seconds: map['realtimeArrival']));
    final isRealtime = map['realtime'];
    final routeNumber = map['trip']['routeShortName'];
    final destination = map['trip']['tripHeadsign'];

    return new Service(scheduledArrival, realtimeArrival, isRealtime, routeNumber, destination);
  }
}