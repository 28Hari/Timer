import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(41, 40, 40, 1),
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter =60;
  late Timer _timer;
  void _stopTimer(){
    _timer.cancel();
  }
  void _startTimer(){
    _counter=60;
    _timer=Timer.periodic( Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter> 0){
          _counter -- ;
        }else{
         _timer.cancel();
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (_counter==0)? Text("Time Done",
              style: TextStyle(
                  color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 40),
            ):
              Text(
                    '$_counter',
                    style:  TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
            ElevatedButton(onPressed: ()=>_startTimer(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: CircleBorder(),
                  fixedSize: Size(110, 110)
                ),
                child: Text("Start Timer"),
            ),
            ElevatedButton(onPressed: ()=>_stopTimer(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: CircleBorder(),
                  fixedSize: Size(110, 110)
              ),
              child: Text("Stop Timer"),
            )
          ],
        ),
      ),
    );
  }
}

