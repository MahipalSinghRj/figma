import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';


const defaultDuration = Duration(seconds: 59, minutes: 01);
const defaultPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 5);

class ExampleSlideCountdown extends StatefulWidget {
  const ExampleSlideCountdown({Key? key}) : super(key: key);

  @override
  State<ExampleSlideCountdown> createState() => _ExampleSlideCountdownState();
}

class _ExampleSlideCountdownState extends State<ExampleSlideCountdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Space"),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideCountdown(onDone: (){
              setState((){

              });
            },
              duration: defaultDuration,
              padding: defaultPadding,
            ),

          ],
        ),
      ),
    );
  }
}
