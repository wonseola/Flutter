import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const tenSecond = 3;
  int totalSeconds = 0;
  late Timer timer;
  bool restTime = true;
  bool isRunning = false;
  int totalPomodoros = 0;
  int totalGolas = 0;
  int maxRound = 2;
  int maxGoal = 12;
  int selectedContainerIndex = -1;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = tenSecond;
        if (totalPomodoros != 0 && totalPomodoros < maxRound) {
          isRunning = true;
        } else {
          timer.cancel();
        }
        if (totalPomodoros == maxRound) {
          totalGolas = totalGolas + 1;
          totalPomodoros = 0;
          restTime = false;
        }
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    restTime = true;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = tenSecond;
      totalPomodoros = 0;
      totalGolas = 0;
      restTime = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          '🩵BOM\'s TIMER💙',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              child: restTime
                  ? Text(
                      format(totalSeconds),
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      'ROUND $totalGolas CLEAR ! \n press start button',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                selectTime(1, 1),
                selectTime(3, 2),
                selectTime(30, 3),
                selectTime(60, 4),
                selectTime(90, 5),
                selectTime(120, 6),
              ]),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline_rounded
                      : Icons.play_circle_outline_sharp,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '$totalPomodoros / $maxRound',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'round',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$totalGolas / $maxGoal',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'goal',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: Center(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.restore_sharp),
                    onPressed: onResetPressed,
                    color: Theme.of(context).cardColor,
                  ),
                  Text(
                    'RESET ALL',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.displayLarge!.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container selectTime(int time, int index) {
    bool isSelected = (index == selectedContainerIndex);

    return Container(
        width: 100,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 8, 3, 67)
              : const Color.fromARGB(255, 165, 165, 189),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedContainerIndex = index;
              totalSeconds = time;
            });
          },
          child: Text(
            '$time',
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ));
  }
}
