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
      body:  TimersList(),
    );
  }


}