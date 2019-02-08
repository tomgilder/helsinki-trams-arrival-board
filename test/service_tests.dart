import 'package:flutter_trams/model/clock.dart';
import 'package:flutter_trams/model/service.dart';
import 'package:test/test.dart';

void main() {
  test('display time correct when due', () {    
    final service = ServiceFactory.realtimeArrivingIn(Duration(seconds: 30));
    expect(service.displayTime, "due");
  });

  test('display time correct when 1 min away', () {    
    final service = ServiceFactory.realtimeArrivingIn(Duration(minutes: 1));
    expect(service.displayTime, "1 min");
  });

  test('display time correct when >1 min away', () {    
    final service = ServiceFactory.realtimeArrivingIn(Duration(minutes: 2));
    expect(service.displayTime, "2 mins");
  });
}

class ServiceFactory
{
  static Service realtimeArrivingIn(Duration duration)
  {
    var baseTime = DateTime.now();
    Clock.setTime(baseTime);
    final arrival = baseTime.add(duration);

    var service = Service(arrival, arrival, true, "1", "Funtime");

    return service;
  }
}