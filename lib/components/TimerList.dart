

import 'dart:developer';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:project_timer/models/Timer.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


class TimersList extends StatelessWidget {
  final CountDownController _controller = CountDownController();
  final int _duration = 10;
  final bool _started = false;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<TimerQuerySnapshot>(
        ref: timersRef,
        builder: (context, AsyncSnapshot<TimerQuerySnapshot> snapshot, Widget? child) {
          if (snapshot.hasError) {log(snapshot.error.toString());}
          if (!snapshot.hasData) return const Text('Loading users...');

          // Access the QuerySnapshot
          TimerQuerySnapshot querySnapshot = snapshot.requireData;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              Timer timer = querySnapshot.docs[index].data;

              return Container(
                height: 500,
                child: GFCard(
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  showImage: true,
                  title: GFListTile(
                    avatar:  const GFAvatar(
                      backgroundImage: AssetImage('images/boruto.jpg'),
                    ),
                    titleText: 'Timer name: ${timer.name},',
                    subTitleText: 'By kaishi',
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularCountDownTimer(
                        // Countdown duration in Seconds.
                        duration: _duration,

                        // Countdown initial elapsed Duration in Seconds.
                        initialDuration: 0,

                        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                        controller: _controller,

                        // Width of the Countdown Widget.
                        width: MediaQuery.of(context).size.width / 10,

                        // Height of the Countdown Widget.
                        height: MediaQuery.of(context).size.height / 10,

                        // Ring Color for Countdown Widget.
                        ringColor: Colors.grey[300]!,

                        // Ring Gradient for Countdown Widget.
                        ringGradient: null,

                        // Filling Color for Countdown Widget.
                        fillColor: Colors.purpleAccent[100]!,

                        // Filling Gradient for Countdown Widget.
                        fillGradient: null,

                        // Background Color for Countdown Widget.
                        backgroundColor: Colors.purple[500],

                        // Background Gradient for Countdown Widget.
                        backgroundGradient: null,

                        // Border Thickness of the Countdown Ring.
                        strokeWidth: 20.0,

                        // Begin and end contours with a flat edge and no extension.
                        strokeCap: StrokeCap.round,

                        // Text Style for Countdown Text.
                        textStyle: const TextStyle(
                          fontSize: 33.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),

                        // Format for the Countdown Text.
                        textFormat: CountdownTextFormat.S,

                        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                        isReverse: false,

                        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                        isReverseAnimation: false,

                        // Handles visibility of the Countdown Text.
                        isTimerTextShown: true,

                        // Handles the timer start.
                        autoStart: false,

                        // This Callback will execute when the Countdown Starts.
                        onStart: () {
                          // Here, do whatever you want
                          debugPrint('Countdown Started');
                        },

                        // This Callback will execute when the Countdown Ends.
                        onComplete: () {
                          // Here, do whatever you want
                          debugPrint('Countdown Ended');
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      _button(title: "Start", onPressed: () => _controller.start()),
                      const SizedBox(
                        width: 10,
                      ),
                      _button(title: "stop", onPressed: () => _controller.start()),
                      const SizedBox(
                        width: 10,
                      ),
                      _button(
                          title: "Restart",
                          onPressed: () => _controller.restart(duration: _duration))
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
  }
  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: ElevatedButton(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),
          onPressed: onPressed,
        ));
  }
}