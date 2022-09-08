import 'package:flutter/material.dart';

void main() => runApp(map1());

class map1 extends StatefulWidget {
  @override
  _ListViewAppState createState() => _ListViewAppState();
}

class _ListViewAppState extends State<map1> {

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    entries.sort();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("お住いの地域"

          ),
        ),
        body: entries.length > 0
            ? ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
            : Center(
          child: Text('No Groceries in your list.'),
        ),

      ),
    );
  }
}