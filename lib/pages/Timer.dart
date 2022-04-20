import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:project_timer/components/TimerList.dart';


class Timer extends StatefulWidget {
  const Timer({Key? key, this.title}) : super(key: key);

  final String? title;


  @override
  State<Timer> createState() => _Timer();
}

class _Timer extends State<Timer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: TimersList(),
      )
    );
  }
}