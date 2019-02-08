import 'package:flutter/material.dart';
import 'package:flutter_trams/parser/service_list_parser.dart';
import 'package:flutter_trams/query.dart';
import 'package:flutter_trams/ui/clock.dart';
import 'package:flutter_trams/ui/service_list_row.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TramHomePage extends StatefulWidget {
  TramHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _TramHomePageState createState() => _TramHomePageState();
}

class _TramHomePageState extends State<TramHomePage> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children:
        [
          Expanded(
            child: Query(
              builder: _queryBuilder,
              options: QueryOptions(document: query, pollInterval: 10)
            )
          ),
          Padding(padding: EdgeInsets.all(50), child: Clock()),
        ]
      )
    );
  }

  static Widget _queryBuilder(QueryResult result)
  {
    if (result.errors != null) {
      return Text(result.errors.toString());
    }

    if (result.loading) {
      return Text('Loading');
    }

    var services = ServiceListParser.Parse(result.data);

    return Padding(
      padding: EdgeInsets.all(30),
      child: ListView.builder
      (
        itemCount: services.length,
        itemBuilder: (context, index) => ServiceListRow(index, services[index])
      )
    );
  }
}