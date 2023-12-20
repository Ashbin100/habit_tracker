import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;
  final VoidCallback settingsTapped;

  const HabitTile({
    required this.habitName,
    required this.onTap,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[100],
                ),
                child:   Padding(
                  padding: const  EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                        //   CircularPercentIndicator(
                        // radius:40,
                        // percent: 0.7,
                        // ),

                        GestureDetector(
                          onTap: onTap,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            //color: Colors.grey[100],
                            child: Stack(
                              children: [
                                //progress circle
                                CircularPercentIndicator(
                                  radius: 60,
                                  ),
                        
                                  //play pause button
                                  Center(child: Icon(habitStarted ? Icons.pause: Icons.play_arrow),
                                  )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),

                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //habit name
                          Text(habitName,style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black, 
                            fontWeight: FontWeight.bold),),

                             const SizedBox(height: 5,),

                             //progress
                           Text( 
                            timeSpent.toString() + '/' + timeGoal.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          ),
                        ],
                      ),
                        ],
                      ),
                      
                      
                      GestureDetector(
                        onTap: settingsTapped,
                        child: const Icon(Icons.settings)),
                    ],
                  ),
                ),
              ),
            );
  }
}