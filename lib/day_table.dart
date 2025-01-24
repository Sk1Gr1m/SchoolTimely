import 'package:flutter/material.dart';


class Daypage extends StatelessWidget {
  final int  selectedDay;


  const Daypage({required this.selectedDay,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar with Hourly Timetable"),
      ),
      body: Column(
        children: [
          Expanded(
            child: HourlyTimetable(selectedDay: selectedDay),
          ),
        ],
      ),
    );
  }
}

class HourlyTimetable extends StatelessWidget {

  final int selectedDay;

  const HourlyTimetable({required this.selectedDay,super.key});

  @override
  Widget build(BuildContext context) {
    // Display selected date
    String formattedDate = '$selectedDay';

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