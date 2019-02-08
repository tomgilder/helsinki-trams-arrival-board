import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trams/ui/tram_home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
          link: HttpLink(uri: 'https://api.digitransit.fi/routing/v1/routers/hsl/index/graphql'),
          cache: InMemoryCache()),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Trams',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue,),
          home: TramHomePage(title: 'Trams'),
        ),
      ),
    );
  }
}