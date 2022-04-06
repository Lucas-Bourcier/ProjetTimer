import 'package:flutter/material.dart';
import 'package:project_timer/components/TimerList.dart';


class Timer extends StatefulWidget {
  const Timer({Key? key, this.title}) : super(key: key);

  final String? title;


  @override
  State<Timer> createState() => _Timer();
}

class _Timer extends State<Timer> {
  final items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
<<<<<<< HEAD
      body:  TimersList(),
    );
  }


=======
      body:  Container(
          height: 500,
          child: GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            showImage: true,
            title: const GFListTile(
              avatar:  GFAvatar(
                backgroundImage: AssetImage('images/boruto.jpg'),
              ),
              titleText: 'Timer 1',
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
                  width: MediaQuery.of(context).size.width / 6,

                  // Height of the Countdown Widget.
                  height: MediaQuery.of(context).size.height / 6,

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
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width:  10,
                        ),
                        _button(title: "Start", onPressed: () => _controller.start(), icon: Icons.play_arrow),

                        const SizedBox(
                          width: 10,
                        ),
                        _button(title: "Pause", onPressed: () => _controller.pause(), icon: Icons.pause),
                      ],
                      ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        _button(title: "Resume", onPressed: () => _controller.resume(), icon: Icons.play_circle),
                        const SizedBox(
                          width: 10,
                        ),
                        _button(
                            title: "Restart",
                            onPressed: () => _controller.restart(duration: _duration), icon: Icons.refresh)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
      )
    );
  }

  Widget _button({required String title,required IconData icon, VoidCallback? onPressed}) {
    return Container(
        child: GFButton(
          color: Colors.deepPurple,
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          icon: Icon(icon, color: Colors.white) ,
          size: GFSize.SMALL,
        ));
  }
>>>>>>> 54dcfe7435348e89cacc2f1a1a30b5f19a2e8822
}