import 'package:counter/CacheHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class Counter extends StatefulWidget {


  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int counter  ;
  // CacheHelper.getData(key: 'LoginUser');
  Future<void> plusCounter() async{
    setState(() {
      counter++;
    });
    CacheHelper.saveData(
      key: 'counter',
      value: counter,
    ).then((value) {
      print("done");
    }).catchError((error) {
      print(error.toString());
    });
  }
  Future<void> minusCounter() async{
    setState(() {
      counter--;
    });
    CacheHelper.saveData(
      key: 'counter',
      value: counter,
    ).then((value) {
      print("done");
    }).catchError((error) {
      print(error.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    CacheHelper.getData(key: 'counter') == null ? counter = 0 : counter  = CacheHelper.getData(key: 'counter');
    return Scaffold(
      backgroundColor: Color(0xff151716),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff151716),
        title: Center(child: Text('Counter')),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed:minusCounter,
              child: Text('MINUS',style: TextStyle(
                color:  Color(0xff60f5b1),
                fontSize: 25,
              ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text('${counter}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed:plusCounter,
                child: Text('PLUS',style: TextStyle(
                  color:  Color(0xff60f5b1),
                  fontSize: 25,
                ),)
            ),
          ],
        ),
      ),
    );
  }
}
