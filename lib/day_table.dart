import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar with Hourly Timetable"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(1990),
            lastDay: DateTime(2260),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          Expanded(
            child: HourlyTimetable(selectedDay: _selectedDay),
          ),
        ],
      ),
    );
  }
}

class HourlyTimetable extends StatelessWidget {
  final DateTime selectedDay;

  HourlyTimetable({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    // Display selected date
    String formattedDate = '${selectedDay.year}-${selectedDay.month}-${selectedDay.day}';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Hourly Timetable for $formattedDate',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 24, // 24 hours
              itemBuilder: (context, index) {
                String hour = (index < 10) ? '0$index:00' : '$index:00';
                return ListTile(
                  title: Text(hour),
                  onTap: () {
                    _showTimeSlotDetails(context, hour);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showTimeSlotDetails(BuildContext context, String time) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details for $time'),
          content: Text('Add details for the event at $time.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}