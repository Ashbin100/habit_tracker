import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habittracker/utils/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //overall habit summary
  List habitList = [
    //[habitName, habitStarted, timeSpent (sec), timeGoal(min)]
    ['Exercise', false, 0, 10],
    ['Read', false, 0, 20],
    ['Meditate', false, 0, 30],
    ['Code', false, 0, 40],
  ];

  void habitStarted(int index){
    //habit started or stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    //keep the time going!
    Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() {
        habitList[index][2]++;
      });
    });
  }

  void settingsOpened(int index){
    showDialog(
      context: context,
       builder: (context){
        return AlertDialog(
          title: Text('Settings for' +habitList[index][0]),
        );
       }
       );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Consistency is key'),
        ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: (context,index){
            return HabitTile(
              habitName: habitList[index][0], 
              onTap: (){
                habitStarted(index);
              }, 
              settingsTapped: (){
                settingsOpened(index);
              }, 
              timeSpent: habitList[index][2], //because timespend is defined in the index 2 of ['Exercise', false, 0, 10], i.e. 0 is time spent
              timeGoal: habitList[index][3], 
              habitStarted: habitList[index][1]
              );
          }
          )



            // HabitTile(
            //   habitName: habitList[0][0],//the 0,0 is the index representing the list i.e['Exercise', false, 0, 10],
            //                               //here this list is in the index 0 and exercise is in the 0 th index inside the list,
            //                               //so the first 0 indicates the first list and another 0 indicates first column of list
            //   onTap: () {},
            //   settingsTapped: () {},
            //   timeSpent: 4,
            //   timeGoal: 12,
            //   habitStarted: false,
              //),
              
              
             
          
        
      ),

    );
  }
}