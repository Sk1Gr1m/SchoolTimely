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
                child: Lesson( time: '45',lesson:'Math',teacher:'Kiril Terziski'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child:Lesson( time: '45',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '45',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '45',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ),   
               Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Lesson( time: '45',lesson:'Programirane',teacher:'Georgi Dimitrov'),
              ), 
            ],
          )
        )
    );
  }
} 
class Lesson extends StatelessWidget {
  late String time;
  late String lesson;
  late String teacher;
      Lesson({required this.time,required this.lesson,required this.teacher,super.key});
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
        child: Center(child: Text(time),),
        width: 200,
        height: 85,
      ),  
      Expanded(child: Column(
        children:[
          Container(   
            decoration: BoxDecoration(
            color:Colors.transparent,
            ),     
            padding: EdgeInsets.all(10),
            child: Center(child: Text(lesson),),
            width: 200,
             height: 44,
          ), 
          Container(
            decoration: BoxDecoration(
            color: Colors.transparent,
            ),
            padding: EdgeInsets.all(10),
            child: Center(child: Text(teacher),),
            width: 200,
             height: 44,
          ), 
        ],
      ))],
    );
  }
}