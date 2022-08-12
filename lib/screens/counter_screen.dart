import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:state_management_examples/providers/counter_provider.dart';
class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    final countprovider=Provider.of<CounterProvider>(context,listen: false);
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      countprovider.setCount();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final countprovider=Provider.of<CounterProvider>(context,listen: false);
    print('build');
    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(builder: (context,value,child){
          return Text(value.count.toString(),style: TextStyle(fontSize: 50),);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
          countprovider.setCount();
          },
      ),
    );
  }
}
