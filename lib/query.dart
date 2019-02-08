String query = """
{
  stops(ids: ["HSL:1122400", "HSL:1122441"])
  {
    name
    code
    desc
    stoptimesWithoutPatterns(numberOfDepartures:3) {
      scheduledArrival
      realtimeArrival
      realtime
      trip {
        tripHeadsign
        routeShortName
      }
    }
  }
}
""".replaceAll('\n', ' ');