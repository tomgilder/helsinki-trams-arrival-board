// Helper class to allow time to be set from tests
class Clock
{
  static var _nowImpl = () => DateTime.now();
  static now() => _nowImpl();

  static setTime(DateTime time) => _nowImpl = () => time;
}