import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _currentDate;
  late int _currentYear;
  late int _currentMonth;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _currentYear = _currentDate.year;
    _currentMonth = _currentDate.month;
  }

  // Returns the days of the week
  List<String> get weekDays {
    return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  }

  // Get the first day of the month
  DateTime get firstDayOfMonth {
    return DateTime(_currentYear, _currentMonth, 1);
  }

  // Get the total number of days in the month
  int get daysInMonth {
    return DateTime(_currentYear, _currentMonth + 0, 0).day;
  }

  // Get the starting weekday of the first day of the month
  int get firstWeekday {
    return firstDayOfMonth.weekday;
  }

  // Generate the day list for the calendar grid
  List<Widget> buildCalendarDays() {
    List<Widget> dayWidgets = [];
    int totalDays = daysInMonth;
    int leadingSpaces = firstWeekday == 7 ? 0 : firstWeekday;

    // Empty spaces in the beginning
    for (int i = 0; i < leadingSpaces; i++) {
      dayWidgets.add(Container());
    }

    // Adds all the days in this month
    for (int day = 1; day <= totalDays; day++) {
      dayWidgets.add(DayCell(day));
    }

    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar for ${_currentDate.month}-${_currentDate.year}"),
      ),
      //TODO change month from int to string
      body: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: weekDays.map((day) => Text(day)).toList(),
          ),
          Container(
            margin: const EdgeInsets.all(16), // Adds space outside the box
            padding: const EdgeInsets.all(8), // Adds space inside the box
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blueAccent, // Border color
                width: 2, // Border width
              ),
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5), // Shadow direction
                ),
              ], // all this for a shadow on the bottom..
            ),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 7,
              physics: const NeverScrollableScrollPhysics(), // not sure if needed..it just disables scrolling..not that you could before...
              children: buildCalendarDays(),
            ),
          ),
        ],
      ),
    );
  }
}

// A custom widget for individual day cells
class DayCell extends StatelessWidget {
  final int day;

  DayCell(this.day);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Selected Day: $day");
      },
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            '$day',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
