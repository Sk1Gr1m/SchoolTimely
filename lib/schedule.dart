import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const  Schedule({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container (
          decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffb95aed), Color(0xffd18ef5), Color(0xfffed1ff)],
          stops: [0, 0.5, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      
        ),
      
          width: 400,
          height:630,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '8:00 - 8:45',lesson:'Bel',teacher:'Alex Genchev'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '8:55 - 9:40',lesson:'Bel',teacher:'Alex Genchev'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '9:50 - 10:35',lesson:'Math',teacher:'Kiril Terziski'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child:Lesson( time: '10:55 - 11:40',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '11:50 - 12:35',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '12:45 - 13:30',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ),   
               Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '13:40 - 14:25',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ), 
            ],
          )
        )
    );
  }
} 
class Lesson extends StatelessWidget {
  final String time;
  final String lesson;
  final String teacher;
      const Lesson({required this.time,required this.lesson,required this.teacher,super.key});
      @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
      Container(
        decoration: BoxDecoration(
        border: Border.all(color:  Colors.white),
        color: Colors.transparent,
        ),
        padding: EdgeInsets.all(10),
        width: 200,
        height: 85,
        child: Center(child: Text(time),),
      ),  
      Expanded(child: Column(
        children:[
          Container(   
            decoration: BoxDecoration(
            color:Colors.transparent,
            ),     
            padding: EdgeInsets.all(10),
            width: 200,
            height: 44,
            child: Center(child: Text(lesson),),
          ), 
          Container(
            decoration: BoxDecoration(
            color: Colors.transparent,
            ),
            padding: EdgeInsets.all(10),
            width: 200,
            height: 44,
            child:  Center(child: Text(teacher),),
          ), 
        ],
      ))],
    );
  }
}