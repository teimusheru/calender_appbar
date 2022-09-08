
import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
  CalendarAgendaController();
  CalendarAgendaController _calendarAgendaControllerNotAppBar =
  CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late DateTime _selectedDateNotAppBBar;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _selectedDateNotAppBBar = DateTime.now();
  }

  //住所変数
  String  kenmei = 'お住いの地域';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAgenda(
        controller: _calendarAgendaControllerAppBar,
        appbar: true,
        selectedDayPosition: SelectedDayPosition.left,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {_calendarAgendaControllerAppBar.goToDay(DateTime.now());},
        ),
        weekDay: WeekDay.long,
        fullCalendarScroll: FullCalendarScroll.horizontal,
        fullCalendarDay: WeekDay.long,
        selectedDateColor: Colors.green.shade900,
        locale: 'ja_JP',
        initialDate: DateTime.now(),
        calendarEventColor: Colors.green,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime.now().add(Duration(days: 180)),
        events: List.generate(
            100,
                (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
        onDateSelected: (date) {
          setState(() {
            _selectedDateAppBBar = date;
          });
        },
        calendarLogo: Image.network(
          'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          scale: 5.0,
        ),
        selectedDayLogo: NetworkImage(
          'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          scale: 15.0,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              child: Text(kenmei, textAlign: TextAlign.left),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                minimumSize: Size(350.0 ,50.0),
                side: const BorderSide(color: Colors.amber),
              ),
              onPressed: () {},


            ),



            SizedBox(
              height: 20.0,
            ),
            Text('aaaaaaaaaaaaa'),
            /*suffixIcon: const Icon(Icons.search),

            hintText: 'お住いの地域',
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18))*/

          ],
        ),
      ),
    );
  }
}